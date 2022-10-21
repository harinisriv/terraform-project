# Creating 2 public and private subnets in 2 different AZ

resource "aws_subnet" "public-subnet-1a" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet-1b"
  }
}

resource "aws_subnet" "private-subnet-1c" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-subnet-1c"
  }
}

resource "aws_subnet" "private-subnet-1d" {
  vpc_id     = aws_vpc.tf-project-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-subnet-1d"
  }
}
