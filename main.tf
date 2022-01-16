provider "aws" {
  region = var.aws_region
}

resource "aws_sfn_state_machine" "simple-workflow" {
  name     = "simple-workflow"
  role_arn = var.aws_iam_role
  definition = <<EOF
{
  "Comment": "A simple workflow example of the Amazon States Language using 3 Task states with exception handling",
  "StartAt": "Hello",
  "States": {
    "Hello": {
      "Type": "Task",
      "Resource": "aws-servive-arn.arn", #Replace resource value with AWS Service ARN
      "Next": "Hi",
      "TimeoutSeconds": 120,
      "Catch" : [{
        "ErrorEquals" : ["States.ALL"],
        "ResultPath": "$.error",
        "Next" : "Exception"
      }]    
    },
    "Hi": {
      "Type": "Task",
      "Resource": "aws-servive-arn.arn", #Replace resource value with AWS Service ARN
      "Next": "World",
      "TimeoutSeconds": 120,
      "Catch" : [{
        "ErrorEquals" : ["States.ALL"],
        "ResultPath": "$.error",
        "Next" : "Exception"
      }]    
    },
    "World": {
      "Type": "Task",
      "Resource": "aws-servive-arn.arn", #Replace resource value with AWS Service ARN
      "Next": "Succeeded",
      "TimeoutSeconds": 120,
      "Catch" : [{
        "ErrorEquals" : ["States.ALL"],
        "ResultPath": "$.error",
        "Next" : "Exception"    
      }]
    },
      "Exception" : {
      "Type": "Task",
      "Resource": "aws-servive-arn.arn",  #Replace resource value with AWS Service ARN      
      "ResultPath": "$.error.exception_handled",
      "Next" : "Failed"
    },
    "Succeeded" : {
      "End" : true,
      "Type" : "Pass"
    },
    "Failed": {
      "Type": "Fail"
    }  
  }
}
EOF
}
