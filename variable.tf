variable "aws_region" {
  default = "us-east-1"
}

variable "cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}

variable "name" {
    description = "Name of the vpc"
    default = "primary-vpc"
}