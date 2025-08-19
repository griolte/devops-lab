########################
# AZs & Subnets
########################
data "aws_availability_zones" "this" {
  state = "available"
}

locals {
  # Use the first 2 AZs in the region
  azs = slice(data.aws_availability_zones.this.names, 0, 2)

  # Derive /24 subnets for public (indexes 0..1) and private (indexes 100..101)
  public_subnet_cidrs  = [for i in range(0, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  private_subnet_cidrs = [for i in range(100, 102) : cidrsubnet(var.vpc_cidr, 8, i)]
}

########################
# VPC + IGW + Route Tables
########################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "devops-lab-vpc" }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "devops-lab-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = { Name = "devops-lab-public-rt" }
}

########################
# Subnets + Associations
########################
resource "aws_subnet" "public" {
  for_each                = toset(local.azs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = local.public_subnet_cidrs[index(local.azs, each.value)]
  availability_zone       = each.value
  map_public_ip_on_launch = true
  tags                    = { Name = "public-${each.value}" }
}

resource "aws_subnet" "private" {
  for_each          = toset(local.azs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = local.private_subnet_cidrs[index(local.azs, each.value)]
  availability_zone = each.value
  tags              = { Name = "private-${each.value}" }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

########################
# Minimal Security Group (egress all)
########################
resource "aws_security_group" "ec2" {
  name        = "devops-lab-ec2-sg"
  description = "Minimal SG for EC2"
  vpc_id      = aws_vpc.this.id
  tags        = { Name = "devops-lab-ec2-sg" }
}

# Egress: allow all outbound
resource "aws_vpc_security_group_egress_rule" "all_out" {
  security_group_id = aws_security_group.ec2.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

# Optional SSH ingress (disabled by default)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  count             = var.ssh_ingress_cidr == null ? 0 : 1
  security_group_id = aws_security_group.ec2.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = var.ssh_ingress_cidr

  lifecycle {
    precondition {
      condition     = var.ssh_ingress_cidr != "0.0.0.0/0" || var.allow_ssh_from_anywhere
      error_message = "SSH 0.0.0.0/0 blocked. Set allow_ssh_from_anywhere=true only if you accept the risk."
    }
  }
}

########################
# AMI: Amazon Linux 2023 via SSM Parameter
########################
data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

########################
# Free‑tier instance type detection (t3.micro first)
########################
data "aws_ec2_instance_type_offerings" "t3micro" {
  location_type = "region"
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
}

locals {
  # If var.instance_type is set, use it; otherwise prefer t3.micro, else fallback to t2.micro
  resolved_instance_type = coalesce(
    var.instance_type,
    length(data.aws_ec2_instance_type_offerings.t3micro.instance_types) > 0 ? "t3.micro" : "t2.micro"
  )
}

########################
# EC2 instance in a public subnet
########################
resource "aws_instance" "web" {
  ami                         = data.aws_ssm_parameter.al2023.value
  instance_type               = local.resolved_instance_type
  subnet_id                   = values(aws_subnet.public)[0].id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = { Name = "devops-lab-ec2" }
}
