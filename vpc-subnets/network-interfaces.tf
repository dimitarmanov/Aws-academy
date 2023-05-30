resource "aws_network_interface" "interface1" {
  subnet_id = aws_subnet.subnet1.id
}

resource "aws_network_interface" "interface2" {
  subnet_id = aws_subnet.subnet2.id
}
