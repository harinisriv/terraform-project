# Creating public route table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.tf-project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-IG.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Creating public rta

resource "aws_route_table_association" "public-rta-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-rta-1b" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public-route-table.id
}
