#resource "aws_iam_role_policy" "s3-policy-attachment" {
#  name = "test-role-policy"
#  role = aws_iam_role.s3-role.name
#
#  policy = file("./policy.json")
#}

data "aws_iam_policy_document" "assumed" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:sts::081056745473:assumed-role/AWSReservedSSO_AWSAdministratorAccessLockedTags_22101e188f8a742c/dimitar_manov@flutterint.com"]
    }
  }
}