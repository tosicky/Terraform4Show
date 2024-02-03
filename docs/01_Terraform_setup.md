## Terraform Installation

Find installation instructions here: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Terraform Language

Terraform language is used to write configurations which tells Terraform what plugins to install, what infrastructure to create, and what data to fetch.

- Blocks are containers representing the configuration of some kind of object, e.g resource, data etc.

For example, the following resource block tells terraform to create an AWS VPC with a provided name and a cidr block.

```
resource "aws_vpc" "primary" {

    name = var.vpc_name
    cidr_block = var.cidr_block

}
```