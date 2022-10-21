resource "aws_instance" "public-instance-1a" {
    ami = "ami-062df10d14676e201"
    instance_type = "t2.micro"
    key_name = "firstkeypair"
    subnet_id = aws_subnet.public-subnet-1a.id
    availability_zone = "ap-south-1a"
    user_data ="${file("userdata.sh")}"
    vpc_security_group_ids = [aws_security_group.allow_80_22.id]

    tags = {
      Name = "public-instance-1a"
      Technical-Owner= "Harini"
    }
}

resource "aws_instance" "public-instance-1b" {
    ami = "ami-062df10d14676e201"
    instance_type = "t2.micro"
    key_name = "firstkeypair"
    subnet_id = aws_subnet.public-subnet-1b.id
    availability_zone = "ap-south-1b"
    user_data ="${file("userdata.sh")}"
    vpc_security_group_ids = [aws_security_group.allow_80_22.id]

    tags = {
      Name = "public-instance-1b"
      Technical-Owner= "Harini"
    }
}

resource "aws_instance" "private-instance-1c" {
    ami = "ami-062df10d14676e201"
    instance_type = "t2.micro"
    key_name = "firstkeypair"
    subnet_id = aws_subnet.private-subnet-1c.id
    availability_zone = "ap-south-1a"
    user_data ="${file("userdata.sh")}"

    tags = {
      Name = "private-instance-1c"
      Technical-Owner= "Harini"
    }
}