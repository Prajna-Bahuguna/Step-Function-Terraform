provider "aws" {
  region = var.aws_region
}

resource "aws_sfn_state_machine" "simple-workflow" {
  name     = "simple-workflow"
  role_arn = var.aws_iam_role
  definition = file("state-definition.json")
}
