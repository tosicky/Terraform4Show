# module "aws_vpc" {
#   source = "./aws_vpc/vpc"
# }

# resource "aws_instance" "test_1" {
#   ami           = "" # us-west-2
#   instance_type = "t2.micro"
  
#   tags = {
#       Name = "${var.customer_name}"
#   }
# }

resource "aws_vpc" "customer_vpc" {
    cidr_block       = "50.0.0.0/16"
    instance_tenancy = "default"

  tags = {
    Name = "${var.customer_name}"
  }
}

resource "aws_subnet" "cust-public-1" {
  vpc_id = aws_vpc.customer_vpc.id
  cidr_block = var.public_subnet_cidr_1

  tags = {
    "Name" = "cust-public"
  }
}

resource "aws_subnet" "cust-public-2" {
  vpc_id = aws_vpc.customer_vpc.id
  cidr_block = var.public_subnet_cidr_2

  tags = {
    "Name" = "cust-public"
  }
}

resource "aws_subnet" "cust-private-1" {
  vpc_id = aws_vpc.customer_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    "Name" = "cust-private"
  }
}