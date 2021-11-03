output "functions" {
  value = zipmap(
    keys(local.function_configs),
    [
      for function in keys(local.function_configs) :
      map(
        "arn", module.lambda_function[function].lambda_function_arn,
        "method", local.function_configs[function].method
      )
  ])
}
