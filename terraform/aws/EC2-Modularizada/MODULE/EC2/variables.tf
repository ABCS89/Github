variable "ami" {
  type = string
  description = "ID da AMI usada para provisionar a instância"
  default = ""
}
variable "instance_type" {
  type = string
  description = "Tipo (classe) da instância"
  default = ""
}
variable "user_data" {
  type = string
  description = "User data utilizado ao provisionar a instância"
  default     = ""
}
variable "provider_region" {
  type = string
  description = "provedor e regiao inserida"
  default     = ""
}
variable "name"{
  type = string
  description = "nome da EC2"
  default= ""
}