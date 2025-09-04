# v0.3.0 – AWS VPC Module

✨ **What's new**

- Introduced the official Terraform AWS VPC module:
  - `terraform-aws-modules/vpc/aws`
  - Created a VPC with 2 public and 2 private subnets
  - Internet Gateway + public route table
  - DNS hostnames & support enabled
- Free Tier safe: no NAT Gateway

📂 **Files**

- `terraform/aws-vpc-module/*`
- `docs/releases/v0.3.0/screenshots/*`

🔧 **How to reproduce**

```bash
cd terraform/aws-vpc-module
terraform init
terraform plan
terraform apply
terraform output
terraform destroy   # optional cleanup
```
