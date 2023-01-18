provider "aws" {
  region = "us-east-1"
}

module "Taxman" {
  source                   = "./aplicacao/taxman"
  Taxman_EC2_name          = var.Taxman_EC2_name
  Taxman_EC2_ami           = var.Taxman_EC2_ami
  Taxman_EC2_instance_type = var.Taxman_EC2_instance_type
  provider_region          = var.provider_region
  availability_zone        = var.availability_zone
}



module "contractus" {
  source                   = "./aplicacao/taxman"
  Taxman_EC2_name          = var.Taxman_EC2_name
  Taxman_EC2_ami           = var.Taxman_EC2_ami
  Taxman_EC2_instance_type = var.Taxman_EC2_instance_type
  provider_region          = var.provider_region
  availability_zone        = var.availability_zone
}



module "bookeper" {
  source                   = "./aplicacao/taxman"
  Taxman_EC2_name          = var.Taxman_EC2_name
  Taxman_EC2_ami           = var.Taxman_EC2_ami
  Taxman_EC2_instance_type = var.Taxman_EC2_instance_type
  provider_region          = var.provider_region
  availability_zone        = var.availability_zone
}


module "loadbalancer" {
  source                   = "./aplicacao/taxman"
  Taxman_EC2_name          = var.Taxman_EC2_name
  Taxman_EC2_ami           = var.Taxman_EC2_ami
  Taxman_EC2_instance_type = var.Taxman_EC2_instance_type
  provider_region          = var.provider_region
  availability_zone        = var.availability_zone
}


