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
    get-coffee-makers = {
      description            = "Fetches coffee makers from DynamoDB."
      function_src_dir       = "coffee-maker"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "GET"
      api_route              = "/v1/coffee/maker"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    create-coffee-maker = {
      description            = "Creates and saves new coffee maker to DynamoDB."
      function_src_dir       = "coffee-maker"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "POST"
      api_route              = "/v1/coffee/maker"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    update-coffee-maker = {
      description            = "Updates coffee maker on DynamoDB."
      function_src_dir       = "coffee-maker"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "PUT"
      api_route              = "/v1/coffee/maker"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    delete-coffee-maker = {
      description            = "Deletes coffee maker on DynamoDB."
      function_src_dir       = "coffee-maker"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "DELETE"
      api_route              = "/v1/coffee/maker"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    get-coffee-grinders = {
      description            = "Fetches coffee grinders from DynamoDB."
      function_src_dir       = "coffee-grinder"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "GET"
      api_route              = "/v1/coffee/grinder"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    create-coffee-grinder = {
      description            = "Creates and saves new coffee grinder to DynamoDB."
      function_src_dir       = "coffee-grinder"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "POST"
      api_route              = "/v1/coffee/grinder"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    update-coffee-grinder = {
      description            = "Updates coffee grinder on DynamoDB."
      function_src_dir       = "coffee-grinder"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "PUT"
      api_route              = "/v1/coffee/grinder"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    },
    delete-coffee-grinder = {
      description            = "Deletes coffee grinder on DynamoDB."
      function_src_dir       = "coffee-grinder"
      environment_variables  = {}
      layers                 = []
      vpc_subnet_ids         = []
      vpc_security_group_ids = []
      policies               = [aws_iam_policy.lambda_iam_policy_dynamodb.arn]
      method                 = "DELETE"
      api_route              = "/v1/coffee/grinder"
      version = {
        dev  = 1 # Autodeploys to latest Lambda version.
        test = 1 # Autodeploys to latest Lambda version.
        prod = 1
      }
    }
  }

  output_type = "zip"
}
