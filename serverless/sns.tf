resource "aws_sns_topic" "default" {
  name = "call-lambda-maybe"
  kms_master_key_id = "alias/my-key-alias"
}

resource "aws_sns_topic_policy" "lambda_topic" {
  arn    = aws_sns_topic.default.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.default.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.func.arn
}