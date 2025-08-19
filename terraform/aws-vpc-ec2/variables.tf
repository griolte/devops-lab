variable "region" {
  description = "Région AWS"
  type        = string
  default     = "ap-northeast-1"
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ssh_ingress_cidr" {
  description = "CIDR autorisé en SSH (optionnel). Ex: 203.0.113.4/32"
  type        = string
  default     = null
}

variable "allow_ssh_from_anywhere" {
  description = "Autoriser 0.0.0.0/0 en SSH (déconseillé) ?"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "Type d’instance EC2 (null => détection t2.micro/t3.micro)"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Nom de la KeyPair existante (optionnel)"
  type        = string
  default     = null
}
