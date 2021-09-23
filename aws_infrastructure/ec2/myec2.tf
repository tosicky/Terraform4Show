module "myEc2" {
    source = "../modules"

    customer_name = "${var.customer_id}"
}