provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "devops-lab"
      ManagedBy = "Terraform"
      Stack     = "aws-vpc-ec2"
    }
  }
}
