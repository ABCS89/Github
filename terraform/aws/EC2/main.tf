# Configure o provider AWS
provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "REGION"
}

# Defina a sua instância EC2
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  key_name      = "example-key"
  security_groups = ["sg-123456"]
}