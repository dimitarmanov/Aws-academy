# resource "aws_instance" "instance1" {
#   ami                  = data.aws_ami.latest_amazon_linux.id
#   instance_type        = "t2.micro"
#   iam_instance_profile = data.aws_iam_instance_profile.example.name
#   subnet_id            = aws_subnet.subnet3.id

#   tags = {
#     name = "terraform-instance-1"
#   }

# }


# resource "aws_instance" "instance2" {
#   ami                  = data.aws_ami.latest_amazon_linux.id
#   instance_type        = "t2.micro"
#   iam_instance_profile = data.aws_iam_instance_profile.example.name
#   subnet_id            = aws_subnet.subnet4.id

#   tags = {
#     name = "terraform-instance-2"
#   }

# }
