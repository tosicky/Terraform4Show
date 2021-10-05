data "aws_ami" "amazon-linux-2" {
 most_recent = true

 owners = ["amazon"]


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}


resource "aws_instance" "test_1" {
  for_each = var.instance
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = each.value.instance_type
  # count = each.value.instance_count
  availability_zone = each.key
  key_name = var.key_name
  user_data = var.user_data
  
  tags = {
      # Name = "${var.customer_name}"
      Name = each.value.environment
  }
}

resource "aws_key_pair" "kp" {
    key_name = "mykey"
    public_key = file(var.path_to_public_key)
}