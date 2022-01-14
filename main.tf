provider "aws" {
  region = var.aws_region
}

resource "aws_sfn_state_machine" "main-workflow" {
  name     = "main-workflow"
  role_arn = "${var.aws_iam_role}"
  definition = <<EOF
{
  "Comment": "A Hello World example of the Amazon States Language using Pass states",
  "StartAt": "Hello",
  "States": {
    "Hello": {
      "Type": "Pass",
      "Result": "Hello",
      "Next": "Hi"
    },
    "Hi": {
      "Type": "Pass",
      "Result": "Hi",
      "Next": "World"
    },
    "World": {
      "Type": "Pass",
      "Result": "World",
      "End": true
    }
  }
}
EOF
}