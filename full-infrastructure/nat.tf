resource "aws_nat_gateway" "subnet1-nat-gw" {
  connectivity_type = "public"
  subnet_id = aws_subnet.public_subnet1.id
  allocation_id = aws_eip.subnet1-nat.id

  tags = {
    Name = "NAT-gw-subnet1"
  }
}

resource "aws_nat_gateway" "subnet2-nat-gw" {
  connectivity_type = "public"
  subnet_id = aws_subnet.public_subnet2.id
  allocation_id = aws_eip.subnet2-nat.id

    tags = {
    Name = "NAT-gw-subnet1"
  }
}

resource "aws_eip" "subnet1-nat" {
  domain = "vpc"
}

resource "aws_eip" "subnet2-nat" {
  domain = "vpc"
}