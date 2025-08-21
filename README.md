# devops-lab
[![CI](https://github.com/griolte/devops-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/griolte/devops-lab/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-≥1.12-blue?logo=terraform)](https://www.terraform.io)
[![TFLint](https://img.shields.io/badge/TFLint-enabled-brightgreen)](https://github.com/terraform-linters/tflint)

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

## Done

- [x] Initial CI (build/test)
- [x] README badges
- [x] Terraform skeleton
- [x] First AWS deployment (EC2 test)
- [x] [Release v0.1.0](docs/releases/v0.1.0/RELEASE.md) — Local backend
- [x] [Release v0.2.0](docs/releases/v0.2.0/RELEASE.md) — Remote backend with **S3 + DynamoDB**

---

## Roadmap

- [ ] IAM user `terraform-lab` + AWS CLI profile `devops-lab`
- [ ] CI enhancements: `terraform fmt` / `tflint` / `terraform validate` / `plan` on PR
- [ ] Auto-generate module docs with `terraform-docs`
- [ ] Basic monitoring (CloudWatch logs/metrics)
- [ ] Containers: build & push with GitHub Actions → Docker Hub
- [ ] Demo application (Flask) deployed behind Nginx
- [ ] Unit tests + coverage badge
- [ ] Multi-environment setup with Terraform workspaces (dev/stage)

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
