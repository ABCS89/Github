#variaveis Taxman para EC2
variable "Taxman_EC2_ami" {
  type = string
  description = "ID da AMI usada para provisionar a instância"
  default = ""
}
variable "Taxman_EC2_instance_type" {
  type = string
  description = "Tipo (classe) da instância"
  default = ""
}
variable "Taxman_EC2_name" {
  description = "Nome da instância"
  default = ""
}
variable "provider_region" {
  description = "Regiao alocada"
  default=""
}














# variable "provider_region"{
#   type = string
#   default = "us-east-1"
#   description = "região a ser utilizada"
# }

# variable "provider_profile"{
#   type = string
#   description = "profile de acesso"
#   default = "default"
# }

# #variable "access_key"{
# #  type = string
# #  description = "access key da conta"
# #}
# #
# #variable "secret_key"{
# #  type = string
# #  description = "secret key da conta"
# #}

# variable "instance_count" {
#   type = number
#   description = "número de instâncias que serão provisionadas"
#   default     = 1
# }

# variable "name" {
#   description = "nome da instância"
#   default = ""
# }

# variable "ami" {
#   type = string
#   description = "id da ami usada para provisionar a instância"
#   default = ""
# }

# variable "instance_type" {
#   type = string
#   description = "tipo (classe) da instância"
#   default = ""
# }

# variable "user_data" {
#   type = string
#   description = "user data utilizado ao provisionar a instância"
#   default     = ""
# }

# variable "enable_ssm" {
#   type = bool
#   description = "habilita o aws ssm session manager. essa é uma forma mais segura de conexão à instância do que a conexão por ssh"
#   default     = true
# }

# variable "key_name" {
#   type = string
#   description = "nome do key pair a ser usado para a instância"
#   default     = ""
# }

# variable "iam_instance_profile" {
#   type = string
#   description = "instance profile do iam vinculado à instância"
#   default     = ""
# }

# variable "subnet_id" {
#   description = "id da subnet onde a instância será provisionada"
#   default     = ""
# }

# variable "subnet_ids" {
#   description = "lista com ids das subnets onde a instância será provisionada"
#   default     = []
# }

# variable "associate_public_ip_address" {
#   type = bool
#   description = "vincula um ip público à instância"
#   default     = false
# }

# variable "vpc_security_group_ids" {
#   description = "lista com ids dos security groups que serão vinculados à instância"
#   type        = list(string)
# }

# variable "monitoring" {
#   type = bool
#   description = "controla se a instância terá monitoramento detalhado"
#   default     = false
# }

# variable "disable_api_termination" {
#   type = bool
#   description = "controla a proteção de destruição (terminate) da instância"
#   default     = false
# }

# variable "source_dest_check" {
#   type = bool
#   description = "controla se o tráfego é roteado para a instância quando o endereço de destino não é o mesmo da instância"
#   default     = true
# }

# variable "cpu_credits" {
#   type = string
#   description = "opção de créditos de cpu da instância (\"unlimited\" ou \"standard\")"
#   default     = "standard"
# }

# variable "ebs_optimized" {
#   type = bool
#   description = "controla se a instância será provisionada como ebs-optimized"
#   default     = false
# }

# variable "root_block_device" {
#   description = "lista com maps de configuração do volume raiz da instância"
#   type        = list(object({}))
#   default = []
# }

# variable "ebs_block_device" {
#   description = "lista com maps de configuração de volumes adicionais da instância"
#   type        = list(object({}))
#   default     = []
# }

# variable "tags" {
#   type = map(string)
#   description = "map de tags da instância e dos volumes"
#   default     = {}
# }

# variable "ebs_block_device_device_name" {
#   description = "o nome do dispositivo a ser montado"
#   default = "/dev/xvda"
# }

# # eip

# variable "eip_count" {
#   description = ""
#   default = false
# }

# variable "eip_vpc" {
#   description = ""
#   default = true
# }