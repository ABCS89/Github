#DOCUMENTACAO https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
  profile = "terraform-aws"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
