terraform {
  required_version = "= 1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend distant S3 (paramétré via backend.hcl à l'init)
  backend "s3" {}
}
