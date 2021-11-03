resource "aws_apigatewayv2_integration" "lambda_integration" {
  for_each = var.lambda_functions

  api_id                 = data.aws_apigatewayv2_api.api_gateway.id
  integration_type       = "AWS_PROXY"
  connection_type        = "INTERNET"
  description            = "Lambda function: ${each.key}"
  integration_method     = each.value.method
  integration_uri        = each.value.arn
  payload_format_version = "2.0"
  credentials_arn        = aws_iam_role.api-gateway-lambda-execution-role.arn
}

resource "aws_apigatewayv2_route" "route" {
  for_each = var.lambda_functions

  api_id    = data.aws_apigatewayv2_api.api_gateway.id
  route_key = "${each.value.method} /v1/coffee"

  target = "integrations/${aws_apigatewayv2_integration.lambda_integration[each.key].id}"
}
