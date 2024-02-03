## Demystifying Terraform terminologies/constructs

### Required_providers

Terraform relies on plugins called "providers" to interact with remote systems. You must declare which providers are required for your configurations, so that Terraform can install and use them. For example, to deploy to a cloud platform, you need to declare the provider plugin and version as required. When using modules, you must declare within each Terraform module which providers are required so that Terraform can install and use them. Provider requirements are declared in a required_providers block.

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }
  }
}
```

For further reading: https://developer.hashicorp.com/terraform/language/providers/requirements

### Variable 

Variable in terraform can be input variables, ouput value or local value. 

`Input variables are parameters passed into your terraform modules without altering your modules source code. Input variables can be defined in a variable file or they can be passed through the command line.`

```
variable "cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default = "10.1.0.0/16"
}
```

For further reading: https://developer.hashicorp.com/terraform/language/values/variables

### Output 

Output are values returned from resources/configuration terraform deployed. These returned values can be exposed to the parent module and displayed on the CLI after running `terraform apply`.

```
output "primary_vpc_cidr" {
  value = aws_vpc.primary.cidr_block
}
```

For further reading: https://developer.hashicorp.com/terraform/language/values/outputs

### Local variable 

Local variables are local to a module. That is, they can only be accessible within the module they asre defined. 

```
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

### Provider 

Providers allow Terraform to interact with cloud providers, SaaS providers, and other APIs. Provider configurations belong in the root module of a Terraform configuration. (Child modules receive their provider configurations from the root module).

A provider configuration is created using a provider block:

```
provider "aws" {
  region  = "us-east-1"
}
```

- The name given in the block header ("aws" in this example) is the local name of the provider to configure. This provider should already be included in the required_providers block.

- The provider block contains configuration arguments for the provider. This arguments are different per provider. Take a look at the provider documentation to know what arguments can be defined within the provider block.

For further reading: 

https://developer.hashicorp.com/terraform/language/providers/configuration

https://registry.terraform.io/?product_intent=terraform#:~:text=Learn%20More-,Featured%20Providers,-See%20all

https://registry.terraform.io/?product_intent=terraform

https://registry.terraform.io/providers/hashicorp/aws/latest/docs


### Resource 

Resources are the most important element in the Terraform language. They are the building blocks for infrastructure configutration. Each resource block describes one or more infrastructure objects. A resource block declares a resource of a specific type with a specific local name. 

Terraform uses the name when referring to the resource in the same module, but it has no meaning outside that module's scope.

`resource <resource_type> <resource_name>`

The `resource_type` determines the kind of infrastructure object it manages and what arguments and other attributes the resource supports.

```
resource "aws_vpc" "main" {
  # Referencing the base_cidr_block variable allows the network address
  # to be changed without modifying the configuration.
  cidr_block = var.cidr_block
}
```

For further reading:

https://developer.hashicorp.com/terraform/language/resources/syntax

### Data 

Data sources allow Terraform to use information defined outside of Terraform, or defined by another separate and deplpoyed terraform configuration.

```
data "aws_ami" "example" {
  most_recent = true
}
```

For further reading: https://developer.hashicorp.com/terraform/language/data-sources

### Module 

Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory. 

Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

You can also create one or more child modules as needed. For more information, see -> https://developer.hashicorp.com/terraform/language/modules

```
module "servers" {
  source = "./app-cluster"

}
```

### Backend 

Backend defines where Terraform stores its state data files.

*Default backend:* If a configuration includes no backend block, Terraform defaults to using the local backend, which stores state as a plain file in the current working directory.

```
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

For further reading:

https://developer.hashicorp.com/terraform/language/settings/backends/configuration

https://developer.hashicorp.com/terraform/language/settings/backends/s3