# v0.2.0 – Terraform Backend (S3 + DynamoDB)

✨ **What's new**

- Implemented a **remote backend** for Terraform:
  - **S3 bucket** to store the Terraform state
  - **DynamoDB table** to manage state locking
- Validated workflow:
  - `terraform init -reconfigure`
  - `terraform apply` → 13 resources created (VPC, subnets, SG, EC2 for testing)
  - `terraform output` → instance & subnet info
- Verified with:
  - `aws s3 ls` and `terraform state pull`
  - `terraform destroy` → cleanup tested successfully

📂 **Files**

- `terraform/aws-s3-dynamo/*`  
- `docs/releases/v0.2.0/screenshots/*`  

🔧 **How to reproduce**

```bash
cd terraform/aws-s3-dynamo
terraform init -reconfigure
terraform plan
terraform apply
terraform output
terraform destroy   # optional cleanup
