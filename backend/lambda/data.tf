data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "archive_file" "lambda_layer" {
  for_each = local.layer_configs

  type        = local.output_type
  source_dir  = "${path.module}/src/layers/${each.key}"
  output_path = "${path.module}/src/layers/${each.key}.${local.output_type}"
}

data "archive_file" "lambda_function" {
  for_each = local.function_configs

  type        = local.output_type
  source_dir  = "${path.module}/src/functions/${each.value.function_src_dir}/${each.key}"
  output_path = "${path.module}/src/functions/${each.value.function_src_dir}/${each.key}.${local.output_type}"
}

data "aws_lambda_layer_version" "ssm_access" {
  layer_name = "ssm-access"
}

data "aws_lambda_layer_version" "web_request" {
  layer_name = "web-request"
}

data "aws_s3_bucket" "lambda_s3_bucket" {
  bucket = "lambda-api.harryseong.com-us-east-1"
}
