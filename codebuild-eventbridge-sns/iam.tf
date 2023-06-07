resource "aws_iam_role_policy_attachment" "codebuild_policy_attach" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = var.policy_arn

}

data "aws_iam_policy_document" "event-bridge" {
  statement {

    actions = [
      "codebuild:StartBuild"
    ]
    resources = [
      aws_codebuild_project.nuke-all.arn
    ]

  }

}

resource "aws_iam_policy" "event_bridge" {
  name        = "event-bridge-policy"
  path        = "/"
  description = "Policy for Event Bridge to run CodeBuild"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.event-bridge.json
}

resource "aws_iam_role" "codebuild_role" {
  name               = "codebuild-custom-role"
  assume_role_policy = data.aws_iam_policy_document.assume-policy.json
}


data "aws_iam_policy_document" "assume-policy" {
  statement {
    Effect    = "Allow"
    Action    = ["sts:AssumeRole"]
    Principal = {
      Type = "service"
      Service = "codebuild.amazonaws.com"
    }
  }
}