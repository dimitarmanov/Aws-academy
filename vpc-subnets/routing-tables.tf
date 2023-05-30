resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-rt1"
  }
}

resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-rt2"
  }
}


resource "aws_route_table" "rt3" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.3.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-rt3"
  }
}


resource "aws_route_table" "rt4" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.4.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-rt4"
  }
}
