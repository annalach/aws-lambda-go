terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.8.0"
    }
  }

  required_version = ">= 1.1.7"
}

locals {
  function_name = "${var.env_name}-${var.function_name}"
}

data "aws_ecr_image" "image" {
  repository_name = split("/", var.repository_uri)[1]
  image_tag       = var.image_tag
}

resource "aws_iam_role" "lambda_exec" {
  name = "${local.function_name}-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_lambda_function" "lambda" {
  function_name = local.function_name
  role          = aws_iam_role.lambda_exec.arn
  image_uri     = "${var.repository_uri}@${data.aws_ecr_image.image.id}"
  package_type  = "Image"
  description   = "Sample Lambda Function, written in Go, deployed as a docker image."
}
