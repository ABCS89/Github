provider "aws" {
  region = "us-east-1"
}
variable "key_name" {default="my-key"}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.example.public_key_openssh}"
}
resource "local_file" "private_key" {
  content  = "${tls_private_key.example.public_key_openssh}"
  filename = "../ssh/private_key.pem"
}


module Taxman {
  source = "./aplicacao/taxman"  
}

