provider "aws" {  
  region  = "us-east-1"
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
# Save the private key to a file
resource "local_file" "private_key" {
  content  = tls_private_key.example.public_key_openssh
  filename = "~/.ssh/private_key.pem"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh"
  }
}
resource "aws_instance" "dev" {
  count = 3
  ami = "ami-026c8acd92718196b"
  instance_type = "t2.micro"
  key_name = "my-key"  
  tags = {
    Name = "dev${count.index}"
  }
  security_groups = [aws_security_group.acesso-ssh.id]
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}
