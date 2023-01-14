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
variable "key_name" {
  type = string
  description = "Nome do Key Pair a ser usado para a instância"
  default     = ""
}