resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.tf-project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project-nat-gw.id
  }

  tags = {
    Name = "private-route-table"
  }
}


resource "aws_route_table_association" "private-rta-1c" {
  subnet_id      = aws_subnet.private-subnet-1c.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-rta-1d" {
  subnet_id      = aws_subnet.private-subnet-1d.id
  route_table_id = aws_route_table.private-route-table.id
}
