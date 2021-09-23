# resource "aws_internet_gateway" "gw" {
#     vpc_id = aws_vpc.customer_vpc.id 

#     tags = {
#         Name = "igw"
#     }
# }

# resource "aws_nat_gateway" "nat_gw" {
#     subnet_id = aws_subnet.prod-subnet.public-1.id
#     allocation_id = aws_eip.nat_gw.id

#     tags = {
#         Name = "NAT_gw"
#     }

#     depends_on = [aws_internet_gateway.gw]

# }

# resource "aws_route_table" "cust_route_table" {
#     vpc_id = aws_vpc.customer_vpc.id

#     route {
#         cidr_block = "${var.public_subnet_cidr}"
#         gateway_id = aws_internet_gateway.gw.id
#     }

#     route {
#         cidr_block = "${var.private_subnet_cidr}"
#         nat_gateway_id = aws_nat_gateway.nat_gw.id
#     }

#     tags = {
#         Name = "cust_route_table"
#     }
# }
