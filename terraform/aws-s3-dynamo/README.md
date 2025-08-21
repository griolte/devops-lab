# Terraform Backend – S3 + DynamoDB (v0.2.0)

This module configures a remote backend for Terraform on AWS:

- **S3 bucket** → stores the Terraform state.
- **DynamoDB table** → manages state locking.

---

## Key steps with screenshots

### 1. Create S3 bucket for state
![S3 Bucket](../../docs/releases/v0.2.0/screenshots/01_backend_bucket_s3.png)

### 2. Create DynamoDB table for state lock
![DynamoDB Lock](../../docs/releases/v0.2.0/screenshots/02_ddb_lock.png)

### 3. Initialize Terraform with reconfigure
![Terraform Init](../../docs/releases/v0.2.0/screenshots/03_init_reconfigure.png)

### 4. Apply configuration (VPC, Subnets, EC2… created for test)
![Terraform Apply](../../docs/releases/v0.2.0/screenshots/04_tf_apply_ok.png)

### 5. Show outputs
![Terraform Output](../../docs/releases/v0.2.0/screenshots/05_tf_output.png)

### 6. Verify tfstate in S3
![S3 tfstate](../../docs/releases/v0.2.0/screenshots/06_s3_tfstate.png)

### 7. Pull Terraform state
![Terraform State Pull](../../docs/releases/v0.2.0/screenshots/07_tf_state_pull.png)

### 8. Confirm no changes (plan noop)
![Terraform Plan Noop](../../docs/releases/v0.2.0/screenshots/08_tf_plan_noop.png)

---

✅ **Release v0.2.0 successfully validated.**
