include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ecr"
}

inputs = {
  env_name        = "demo"
  repository_name = "aws-lambda-go"
}
