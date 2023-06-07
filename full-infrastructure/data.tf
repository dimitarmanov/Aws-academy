## Getting latest Amazon Linux image ##
#data "aws_ami" "latest_amazon_linux" {
#  most_recent = true
#  owners      = ["amazon"]
#
#  filter {
#    name   = "name"
#    values = [var.image_name]
#  }
#}
#
### Query VPC and subnets
#data "aws_vpc" "main_vpc" {
#  id = aws_vpc.main_vpc.id
#}

#data "aws_subnets" "default_vpc_subnets" {
#  filter {
#    name   = "vpc-id"
#    values = [data.aws_vpc.main_vpc.id]
#  }
#}

## Creating assume policy ##
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "ssm_managed" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

## For SNS ##

data "aws_iam_policy_document" "sns_policy" {
  policy_id = "sns-policy"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [aws_sns_topic.sns_email.arn]
  }
}