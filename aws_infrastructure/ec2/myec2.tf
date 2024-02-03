module "myEc2" {
    source = "../modules"
    aws_access_key = var.aws_access_key
    aws_secret_key = var.aws_secret_key
    key_name = "mykey"
    region = "us-west-2"
}