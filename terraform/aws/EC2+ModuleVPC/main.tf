provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./MODULES/VPC"

  provider_region = var.vpc_provider_region

  name = var.vpc_name
  cidr = var.vpc_cidr

  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  environment = var.environment  
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
resource "aws_instance" "example" {
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  key_name      = "my-key"

  tags = {
    Name = "My EC2 Instance"
  }
}
