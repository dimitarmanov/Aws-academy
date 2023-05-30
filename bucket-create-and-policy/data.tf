data "aws_iam_policy_document" "permissions" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:Describe*",
      "s3:List*"
    ]

    resources = [
      "arn:aws:s3:::dma-s3-bucket-test/*",
      "arn:aws:s3:::dma-s3-bucket-test",
    ]
  }
}
data "aws_iam_policy_document" "assumed" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:sts::081056745473:assumed-role/AWSReservedSSO_AWSAdministratorAccessLockedTags_22101e188f8a742c/dimitar_manov@flutterint.com"]
    }
  }
}

# data "aws_iam_policy_document" "s3-access" {
#   statement {
#     actions = [

#     ]

#   }
  
# }