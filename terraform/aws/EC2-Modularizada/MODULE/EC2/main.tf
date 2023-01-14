
resource "aws_instance" "main" {
  
  ami =  var.ami
  instance_type = var.ami 
  tags = {
  "Name" = var.name
  }
  
  # Assign a public IP address
  # associate_public_ip_address = true   
  # Add a key pair for SSH access
  
  
}
