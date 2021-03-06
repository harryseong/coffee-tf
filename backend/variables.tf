variable "project_name" {
  description = "Project name. Ex: 'harryseong'"
  type        = string
}

variable "domain_name" {
  description = "Domain name of application. Ex: 'harryseong.com'"
  type        = string
}

variable "public_hosted_zone_id" {
  description = "Route53 public hosted zone ID."
  type        = string
}

variable "vpc_default_security_group_id" {
  description = "VPC's default security group ID."
  type        = string
}

variable "vpc_private_subnet_ids" {
  description = "VPC's private subnet IDs."
  type        = list(string)
}

variable "api_gatweway_id" {
  description = "API gateway ID."
  type        = string
}
