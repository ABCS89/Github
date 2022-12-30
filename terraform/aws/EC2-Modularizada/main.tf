provider "aws" {
  region = "us-east-1"
}

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


module "network" {
  source = "../modules/network"

  name = var.name

  cidr = var.cidr
  azs  = var.azs

  public_subnets = var.public_subnets
}


resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"  
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = {
  "Name" = "EC2-${count.index}"
  }
  # Assign a public IP address
  associate_public_ip_address = true   
  # Add a key pair for SSH access
  key_name = "my-key"
  
}

