data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_apigatewayv2_api" "api_gateway" {
  api_id = var.api_gatweway_id
}
