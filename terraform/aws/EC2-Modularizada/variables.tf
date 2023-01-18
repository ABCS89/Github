variable "Taxman_EC2_ami" {
  type        = string
  description = "ID da AMI usada para provisionar a instância"
  default     = ""
}
variable "Taxman_EC2_instance_type" {
  type        = string
  description = "Tipo (classe) da instância"
  default     = ""
}
variable "Taxman_EC2_name" {
  description = "Nome da instância"
  default     = ""
}
variable "provider_region" {
  description = "Regiao alocada"
  default     = ""
}

variable "availability_zone" {
  default = ""
}
