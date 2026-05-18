resource "aws_vpc" "aws_static_website_hosting" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "aws_static_website_hosting"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.aws_static_website_hosting.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "my-public-rt" {
  vpc_id = aws_vpc.aws_static_website_hosting.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "my-public-rt"
  }
}
