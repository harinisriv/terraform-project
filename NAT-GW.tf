resource "aws_eip" "public-eip" {
  vpc      = true
}

resource "aws_nat_gateway" "project-nat-gw" {
  allocation_id = aws_eip.public-eip.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "project-nat-gw"
  }
  depends_on = [aws_internet_gateway.project-IG]
}
