resource "aws_kms_key" "sns" {
  description = "example"
}

resource "aws_kms_key_policy" "sns" {
  key_id = aws_kms_key.sns.id
  policy = jsonencode({
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}
resource "aws_kms_alias" "a" {
  name          = "alias/my-key-alias"
  target_key_id = aws_kms_key.sns.id
}