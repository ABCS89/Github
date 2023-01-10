vpc_name = "alume"
vpc_cidr = "10.0.0.0/16"
vpc_private_subnets = [ "10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
vpc_public_subnets = [ "10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]
vpc_enable_nat_gateway = true
vpc_tags = {
  Name = "Alume"
}