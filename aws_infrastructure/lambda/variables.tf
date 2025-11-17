# variable "aws_access_key" {
  
# }

# variable "aws_secret_key" {
  
# }

variable "region" {
  default = "us-east-2"
}

variable "customer_name" {
    type = string
    description = "VPC name for customers"
    default = "tomtom"
}