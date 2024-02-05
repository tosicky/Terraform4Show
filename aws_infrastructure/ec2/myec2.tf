module "myEc2" {
    source = "../modules"
    key_name = "mykey"
    region = "us-west-2"
}