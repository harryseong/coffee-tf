locals {
  tags = {
    Terraform   = "true"
    Environment = var.env
    Application = var.project_name
  }

  api_prefix = "api"
  api_url    = format("%s.%s", local.api_prefix, var.domain_name)

  layer_configs = {
  }

  function_configs = {
    get-coffee-items = {
      description            = "Fetches coffee items from DynamoDB."
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "GET"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    create-coffee-item = {
      description            = "Creates and saves new coffee item to DynamoDB."
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "POST"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    update-coffee-item = {
      description            = "Updates coffee item on DynamoDB."
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "PUT"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    delete-coffee-item = {
      description            = "Deletes coffee item on DynamoDB."
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "DELETE"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    }
  }

  output_type = "zip"
}
