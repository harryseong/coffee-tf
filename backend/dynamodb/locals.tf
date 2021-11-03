locals {
  tags = {
    Terraform   = "true"
    Environment = var.env
    Application = var.project_name
  }

  dynamodb_table_configs = {
    coffee_grinders = {
      create_table   = true
      hash_key       = "manufacturer"
      range_key      = "model"
      billing_mode   = "PROVISIONED"
      read_capacity  = 5
      write_capacity = 1
      attributes = [
        {
          name = "manufacturer"
          type = "S"
        },
        {
          name = "model"
          type = "S"
        }
      ]
    }

    coffee_makers = {
      create_table   = true
      hash_key       = "manufacturer"
      range_key      = "model"
      billing_mode   = "PROVISIONED"
      read_capacity  = 5
      write_capacity = 1
      attributes = [
        {
          name = "manufacturer"
          type = "S"
        },
        {
          name = "model"
          type = "S"
        }
      ]
    }
  }
}
