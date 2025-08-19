# devops-lab

[![CI](https://github.com/griolte/devops-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/griolte/devops-lab/actions/workflows/ci.yml)

Showcase DevOps/SRE lab: infrastructure as code (Terraform), containers (Docker), orchestrator (Kubernetes), observability, and security.  
This repository is structured by modules and serves as a **portfolio project**.

---

## Table of Contents

- `terraform/` — Infrastructure as Code (AWS, GCP)  
- `docker/` — Container images & best practices  
- `k8s/` — Manifests, Helm charts  
- `observability/` — Logs, metrics, traces  
- `security/` — Scans & policies  
- `docs/` — Documentation & diagrams  

---

## Tech Stack

- **Cloud & IaC**: Terraform, AWS, GCP  
- **Containers & Orchestration**: Docker, Kubernetes  
- **CI/CD**: GitHub Actions (fmt, validate, TFLint, terraform-docs)  
- **Linting & Docs**: TFLint, terraform-docs  

---

## CI Validation

Every push or pull request triggers **GitHub Actions**:
1. `terraform fmt` — Enforces code formatting  
2. `terraform validate` — Validates Terraform syntax & logic  
3. `tflint` — AWS provider linting rules  
4. *(optional)* `terraform-docs` — Auto-generate Inputs/Outputs documentation  

👉 Status is displayed above in the **CI badge**.

---

## Purpose

- Learn, test, and demonstrate DevOps workflows end-to-end.  
- Build reusable Terraform modules and CI pipelines.  
- Showcase professional practices: IaC, linting, docs, GitHub Actions.  
