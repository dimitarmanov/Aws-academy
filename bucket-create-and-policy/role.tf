resource "aws_iam_role" "test-role" {
  name               = "test-role"
  assume_role_policy = data.aws_iam_policy_document.assumed.json
}
resource "aws_iam_role_policy" "test-policy-attachment" {
  name   = "test-role-policy"
  policy = data.aws_iam_policy_document.permissions.json
  role   = aws_iam_role.test-role.id
}

# resource "aws_iam_role" "bucket-role" {
#   name = "list-buckets-role"
#   assume_role_policy = 
# }