variable "customer_name" {
    type = string
    description = "VPC name for customers"
    default = "ProjCustomer"
}

# variable "region" {
#     type = list
#     description = "regions"
#     default = ["us-west-1", "us-west-2"]
# }

variable "key_name" {
    description = "name of key"
    type = string
    default = null
}

variable "user_data" {
    description = "user data for post-setup"
    # type = string
    default = null
}


variable "instance" {
  
  type = map
  description = "Instances provisioning details"
  default = {
      us-west-2a = {
          "environment" = "dev"
          "instance_type" = "t2.micro"
        #   "instance_count" = 1
      },

      us-west-2b = {
          "environment" = "stage"
          "instance_type" = "t2.nano"
        #   "instance_count" = 1
      }

  }
}

variable "path_to_public_key" {
    default = "../modules/mykey.pub"
  
}

variable "path_to_private_key" {
    default = "mykey"
  
}

variable "region" {
  
}
