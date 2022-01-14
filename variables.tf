variable "aws_region" {
  default = "us-east-2"
} 

variable "aws_iam_role" {
    default = "arn:aws:iam::sample-role-name:role/step-func-demo" #Edit this with IAM Role ARN that has permission of services used with step function and IAM: PassRole
}
