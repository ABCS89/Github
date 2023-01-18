module  ec2 {
  source = "../../MODULE/EC2"     
  Taxman_EC2_name = var.Taxman_EC2_name
  Taxman_EC2_ami  = var.Taxman_EC2_ami
  Taxman_EC2_instance_type = var.Taxman_EC2_instance_type
  provider_region =  var.provider_region
  

}
