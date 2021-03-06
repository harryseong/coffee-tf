variable "project_name" {
  description = "Project name. Ex: 'harryseong'"
  type        = string
}

variable "domain_name" {
  description = "Domain name of application. Ex: 'harryseong.com'"
  type        = string
}

variable "public_hosted_zone_domain_name" {
  description = "Public hosted zone domain name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "vpc_default_sg_name" {
  description = "Default VPC security group name."
  type        = string
}

variable "codestarconnections_connection_arn" {
  description = "CodeStarConnections ARN for connection to GitHub."
  type        = string
}

variable "api_gatweway_id" {
  description = "API gateway ID."
  type        = string
}
