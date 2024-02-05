# resource "aws_vpc" "customer_vpc" {
#     cidr_block       = "10.0.0.0/16"
#     instance_tenancy = "default"

#   tags = {
#     Name = "customer_a"
#   }
# }

resource "aws_vpc" "main" {
  # Referencing the base_cidr_block variable allows the network address
  # to be changed without modifying the configuration.
   cidr_block = var.cidr_block

}

resource "aws_ec2_tag" "main" {
  resource_id = aws_vpc.main.id
  key         = "Name"
  value       = "Primary-vpc"
}