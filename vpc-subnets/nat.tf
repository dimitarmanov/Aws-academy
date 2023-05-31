resource "aws_nat_gateway" "nat1" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.subnet1.id
  allocation_id     = aws_eip.eip1.id

  tags = {
    Name = "terraform-nat1"
  }
}

resource "aws_nat_gateway" "nat2" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.subnet2.id
  allocation_id     = aws_eip.eip2.id


  tags = {
    Name = "terraform-nat2"
  }
}

resource "aws_eip" "eip1" {
  domain = "vpc"
}

resource "aws_eip" "eip2" {
  domain = "vpc"
}
