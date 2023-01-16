# resource "aws_security_group" "ssh" {
#   name        = "allow_ssh"
#   description = "allow ssh access" 
#   vpc_id = module.vpc.vpc_id
#    #["${output.vpc_id.value}"]

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }