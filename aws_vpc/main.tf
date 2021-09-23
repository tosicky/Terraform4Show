# module "aws_vpc" {
#   source = "./aws_vpc/vpc"
# }

# resource "aws_instance" "test_1" {
#   ami           = "ami-005e54dee72cc1d00" # us-west-2
#   instance_type = "t2.micro"
  
#   tags = {
#       Name = "${var.customer_name}"
#   }
# }

resource "aws_vpc" "customer_vpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"

  tags = {
    Name = "${var.customer_name}"
  }
}