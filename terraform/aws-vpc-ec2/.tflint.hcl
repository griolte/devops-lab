plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  # prends la dernière 0.4x stable si besoin
  version = "0.42.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

config {
  call_module_type = "none"
}

rule "aws_instance_invalid_type" { enabled = true }
