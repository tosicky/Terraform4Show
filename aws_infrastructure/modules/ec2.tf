resource "aws_instance" "test_1" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"
  
  tags = {
      Name = "${var.customer_name}"
  }
}
