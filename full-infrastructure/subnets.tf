#resource "aws_subnet" "public_subnet1" {
#  vpc_id = aws_vpc.main_vpc.id
#  cidr_block = "10.0.1.0/24"
#  availability_zone = "eu-west-1a"
#
#  tags = {
#    Name = "Public-subnet1"
#  }
#}
#
#
#resource "aws_subnet" "public_subnet2" {
#  vpc_id = aws_vpc.main_vpc.id
#  cidr_block = "10.0.2.0/24"
#  availability_zone = "eu-west-1b"
#
#  tags = {
#    Name = "Public-subnet2"
#  }
#}
#
#
#resource "aws_subnet" "private_subnet1" {
#  vpc_id = aws_vpc.main_vpc.id
#  cidr_block = "10.0.3.0/24"
#  availability_zone = "eu-west-1a"
#
#  tags = {
#    Name = "Private-subnet1"
#  }
#}
#
#resource "aws_subnet" "private_subnet2" {
#  vpc_id = aws_vpc.main_vpc.id
#  cidr_block = "10.0.4.0/24"
#  availability_zone = "eu-west-1b"
#
#  tags = {
#    Name = "Private-subnet2"
#  }
#}