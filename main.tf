module "frontend" {
  for_each = toset(["test", "prod"])
  source   = "./frontend"
  env      = each.value

  project_name            = var.project_name
  domain_name             = var.domain_name
  public_hosted_zone_id   = data.aws_route53_zone.public_hosted_zone.zone_id
  codestarconnections_arn = data.aws_codestarconnections_connection.github.id
}

module "backend" {
  source = "./backend"

  project_name                  = var.project_name
  domain_name                   = var.domain_name
  public_hosted_zone_id         = data.aws_route53_zone.public_hosted_zone.zone_id
  vpc_default_security_group_id = data.aws_security_group.vpc_default_sg.id
  vpc_private_subnet_ids        = data.aws_subnet_ids.private.ids
  api_gatweway_id               = var.api_gatweway_id
}
