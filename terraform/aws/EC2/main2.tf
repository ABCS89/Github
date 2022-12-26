provider "aws" {

    region= "us-east-1"
  
}

resource "aws_instance" "example" {
  ami           = "ami-0574da719dca65348" #ubuntu 
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  security_groups = ["sg-049df9d5548d7eeb3"]
  subnet_id     = "subnet-0b9d966e9775dd1e1"
  tags = {
    Name = "example-instance"
  }
}
