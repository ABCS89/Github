variable "cidr" {
  description = "VPC cidr block. Example: 10.0.0.0/16"
  default = "10.0.0.0/24"
}

variable "environment" {
  description = "The name of the environment"
}
variable "name" {
  description = "Nome da VPC"
}

variable "provider_region"{
  type = string
  default = "us-east-1"
  description = "Região a ser utilizada"
}

variable "enable_private_route_table_propagation" {
  description = "Habilita propagação de rotas do VPN Gateway para a route table privada"
  default     = false
}

variable "public_subnets" {
  description = "Lista de CIDRs das subnets públicas"
  default     = []
}
variable "enable_nat_gateway" {
  description = "Habilita criação de um NAT Gateway; requer ao menos uma subnet pública"
  default     = true
}

variable "vpc_tags" {
  description = "Map de tags aplicadas à VPC"
  default     = {}
  type        = map(string)
}