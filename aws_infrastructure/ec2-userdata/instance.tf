module "docker-ec2" {
    source = "../modules"
    key_name = "mykey"
    user_data = data.cloudinit_config.userdata.rendered
    aws_access_key = var.aws_access_key
    aws_secret_key = var.aws_secret_key
    region = "us-west-2"
}