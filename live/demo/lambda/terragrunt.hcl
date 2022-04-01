include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/lambda"
}

dependency "ecr" {
  config_path = "../ecr"
}

inputs = {
  env_name      = "demo"
  function_name = "aws-lambda-go"
  image_uri     = "${dependency.ecr.outputs.repository_uri}:0.1.0"
}
