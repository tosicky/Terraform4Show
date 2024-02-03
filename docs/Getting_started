## Getting Started

Now, let's run our first infrastructure configuration. Create a file with the name `main.tf` and copy the code below into the file.

```
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

output "primary_vpc_cidr" {
  value = aws_vpc.primary.cidr_block
}
```

## Running your first terraform code

To execute your first terraform code, run the command `terraform init` from the root of your project directory.

Then run `terraform plan` to see what terraform plans to deploy based on your configuration file(s). It is also a way to know if there is an error within your configuration files.

Finally, run `terraform apply` to apply/deploy the configuration on your environment(s). 