# AWS VPC Module (v0.3.0)

This project deploys an AWS VPC using the official Terraform module:

- 1 VPC with CIDR `10.0.0.0/16`
- 2 public subnets
- 2 private subnets
- Internet Gateway + public route table
- DNS support enabled
- No NAT Gateway (Free Tier friendly)

---

## Key steps with screenshots

### 1. Terraform init
![Terraform Init](../../docs/releases/v0.3.0/screenshots/01_tf_init.png)

### 2. Terraform plan
![Terraform Plan](../../docs/releases/v0.3.0/screenshots/02_tf_plan.png)

### 3. Terraform apply
![Terraform Apply](../../docs/releases/v0.3.0/screenshots/03_tf_apply.png)

### 4. Outputs
![Terraform Output](../../docs/releases/v0.3.0/screenshots/04_tf_output.png)

### 5. AWS Console – VPC
![AWS VPC](../../docs/releases/v0.3.0/screenshots/05_vpc.png)

### 6. AWS Console – Subnets
![AWS Subnets](../../docs/releases/v0.3.0/screenshots/06_subnets.png)

### 7. AWS Console – Route Tables
![AWS Route Tables](../../docs/releases/v0.3.0/screenshots/07_routes.png)

### 8. Terraform plan noop (after apply)
![Terraform Plan Noop](../../docs/releases/v0.3.0/screenshots/08_tf_plan_noop.png)

---

## Architecture (Mermaid)

```mermaid
flowchart LR
    IGW[Internet Gateway]
    RT[Public Route Table<br/>0.0.0.0/0 → IGW]
    VPC[VPC 10.0.0.0/16]

    subgraph "AZ-a"
        PubA[Public Subnet /24]
        PrivA[Private Subnet /24]
    end

    subgraph "AZ-c"
        PubC[Public Subnet /24]
        PrivC[Private Subnet /24]
    end

    IGW --> RT
    RT --> PubA
    RT --> PubC
    VPC --> PubA
    VPC --> PrivA
    VPC --> PubC
    VPC --> PrivC
```

---

✅ **Release v0.3.0 successfully validated.**
