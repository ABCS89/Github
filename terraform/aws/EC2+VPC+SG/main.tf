# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Create a security group
resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
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
  filename = "/home/vnesp/.ssh/private_key.pem"
}
# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  subnet_id              = aws_subnet.public.id
   # Assign a public IP address
  associate_public_ip_address = true 
    tags = {
    "Name" = "EC2-web"
  }

  # Add a key pair for SSH access
  key_name = "my-key"
}









