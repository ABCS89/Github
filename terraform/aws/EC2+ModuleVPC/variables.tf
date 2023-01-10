# Variables VPC

variable "vpc_name" {
  description = "Nome da VPC"
  default = "VPC test" 
}

variable "vpc_provider_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
}

variable "vpc_private_subnets" {
  description = "Lista de CIDRs das subnets privadas"
  default     = []
}

variable "vpc_public_subnets" {
  description = "Lista de CIDRs das subnets públicas"
  default     = []
}

variable "vpc_enable_nat_gateway" {
  description = "Habilita criação de um NAT Gateway; requer ao menos uma subnet pública"
  default     = true
}

variable "environment" {
  default = "production"
}

variable "vpc_tags" {
  description = "Map de tags comuns a todos os recursos"
  default     = {}
  type        = map(string)
}
