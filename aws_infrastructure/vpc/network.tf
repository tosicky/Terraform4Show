resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.customer_vpc.id 

    tags = {
        Name = "igw"
    }
}

resource "aws_eip" "nat_gw" {

    depends_on = [
      aws_internet_gateway.gw
    ]
}

resource "aws_nat_gateway" "nat_gw" {
    subnet_id = aws_subnet.cust-private-1.id
    allocation_id = aws_eip.nat_gw.id

    tags = {
        Name = "NAT_gw"
    }

    depends_on = [aws_internet_gateway.gw]

}

resource "aws_route_table" "cust_route_table_pb_1" {
    vpc_id = aws_vpc.customer_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }


    tags = {
        Name = "cust_pub_route_table"
    }
}

resource "aws_route_table_association" "rt_pub_a" {
    subnet_id = aws_subnet.cust-public-1.id
    route_table_id = aws_route_table.cust_route_table_pb_1.id
}

resource "aws_route_table" "cust_route_table_pb_2" {
    vpc_id = aws_vpc.customer_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "cust_pub_route_table"
    }
}

resource "aws_route_table_association" "rt_pub_b" {
    subnet_id = aws_subnet.cust-public-2.id
    route_table_id = aws_route_table.cust_route_table_pb_2.id
}

resource "aws_route_table" "cust_route_table_pr_1" {
    vpc_id = aws_vpc.customer_vpc.id

    route {
        cidr_block = var.private_subnet_cidr
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }

    tags = {
        Name = "cust_priv_route_table"
    }
}

resource "aws_route_table_association" "rt_priv_a" {
    subnet_id = aws_subnet.cust-private-1.id
    route_table_id = aws_route_table.cust_route_table_pr_1.id
}

# resource "aws_route_table" "cust_route_table_pr_2" {
#     vpc_id = aws_vpc.customer_vpc.id

#     route {
#         cidr_block = "${var.private_subnet_cidr}"
#         nat_gateway_id = aws_nat_gateway.nat_gw.id
#     }

#     tags = {
#         Name = "cust_priv_route_table"
#     }
# }


