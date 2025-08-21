# v0.1.0 – VPC + EC2 (t3.micro)

## ✨ What’s new
- Provisioned a complete VPC with:
  - Internet Gateway
  - Public and private subnets
  - Associated route tables
  - Security groups (inbound/outbound)
- Deployed a `t3.micro` EC2 instance (Amazon Linux 2023)

## 📁 Files
- `terraform/aws-vpc-ec2/*`

## 🔧 How to reproduce
```bash
cd terraform/aws-vpc-ec2
terraform init
terraform plan
terraform apply
terraform output
