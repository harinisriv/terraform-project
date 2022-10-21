#Creating VPC 

resource "aws_vpc" "tf-project-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf-project-vpc"
  }
}

# Creating security groups for instances

resource "aws_security_group" "allow_80_22" {
  name        = "Allow_port-80-and-port-22"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.tf-project-vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80_22"
  }
}

# security group for the load balancer

resource "aws_security_group" "allow_80" {
  name        = "Allow_port-80"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.tf-project-vpc.id

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80"
  }
}