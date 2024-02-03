variable "customer_name" {
    type = string
    description = "VPC name for customers"
}

variable "aws_access_key" {
  
}

variable "aws_secret_key" {
  
}

variable "region" {
  default = "us-west-2"
}

variable "public_subnet_cidr_1" {
  default = "50.0.10.0/24"
}

variable "public_subnet_cidr_2" {
  default = "50.0.20.0/24"
}

variable "private_subnet_cidr" {
  default = "50.0.60.0/24"
}