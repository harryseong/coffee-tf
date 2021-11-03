resource "aws_s3_bucket_object" "lambda_layer_s3_object" {
  for_each = toset(keys(local.layer_configs))

  bucket      = data.aws_s3_bucket.lambda_s3_bucket.id
  key         = "layers/${each.key}.${local.output_type}"
  source      = data.archive_file.lambda_layer[each.key].output_path
  source_hash = filemd5(data.archive_file.lambda_layer[each.key].output_path)
  etag        = filemd5(data.archive_file.lambda_layer[each.key].output_path)
  tags        = local.tags
}

resource "aws_s3_bucket_object" "lambda_function_s3_object" {
  for_each = toset(keys(local.function_configs))

  bucket      = data.aws_s3_bucket.lambda_s3_bucket.id
  key         = "functions/${each.key}.${local.output_type}"
  source      = data.archive_file.lambda_function[each.key].output_path
  source_hash = filemd5(data.archive_file.lambda_function[each.key].output_path)
  etag        = filemd5(data.archive_file.lambda_function[each.key].output_path)
  tags        = local.tags
}
