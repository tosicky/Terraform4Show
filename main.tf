# resource "aws_vpc" "customer_vpc" {
#     cidr_block       = "10.0.0.0/16"
#     instance_tenancy = "default"

#   tags = {
#     Name = "customer_a"
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }
  }
}

variable "aws_region" {}

variable "cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}

variable "name" {
    description = "Name of the vpc"
    default = "primary-vpc"
}


provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  # Referencing the base_cidr_block variable allows the network address
  # to be changed without modifying the configuration.
  cidr_block = var.cidr_block
}