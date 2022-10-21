#Creating Internet GW

resource "aws_internet_gateway" "project-IG" {
  vpc_id = aws_vpc.tf-project-vpc.id

  tags = {
    Name = "project-IG"
  }
}