locals {
  tags = {
    Terraform   = "true"
    Environment = var.env
    Application = var.project_name
  }

  webapp_prefix = var.env == "prod" ? "coffee" : "coffee-${var.env}"
  webapp_url    = "${local.webapp_prefix}.${var.domain_name}"
}
