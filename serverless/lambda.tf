resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.default.arn
}

resource "aws_lambda_function" "func" {
  filename      = "lambda.zip"
  function_name = "lambda_called_from_sns"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "describe-ec2.lambda_handler"
  runtime       = "python3.10"
}


