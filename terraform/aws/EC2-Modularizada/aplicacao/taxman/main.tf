module  ec2 {
  source = "../../MODULE/EC2"     
  ami                 = var.Taxman_EC2_ami
  instance_type        = var.Taxman_EC2_instance_type    

}
