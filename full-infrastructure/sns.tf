resource "aws_sns_topic" "sns_email" {
  name = "email-notification"
}

resource "aws_sns_topic_policy" "sns_email" {
  arn    = aws_sns_topic.sns_email.arn
  policy = data.aws_iam_policy_document.sns_policy.json
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  endpoint  = "molten988@gmail.com"
  protocol  = "email"
  topic_arn = aws_sns_topic.sns_email.arn
}