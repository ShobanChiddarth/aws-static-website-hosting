resource "aws_subnet" "my-public-subnet" {
    vpc_id = aws_vpc.aws_static_website_hosting.id
    cidr_block = "10.0.0.0/24"
    availability_zone       = "ap-south-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "my-subnet"
    }
}

resource "aws_route_table_association" "my-rt-association" {
    subnet_id = aws_subnet.my-public-subnet.id
    route_table_id = aws_route_table.my-public-rt.id
}
