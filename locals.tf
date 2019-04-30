locals {
  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }

  name_long = "${var.stack}-${var.client_name}-${var.environment}-kv"
  name      = "${coalesce(var.custom_name, substr(local.name_long, 0, length(local.name_long) > 24 ? 23 : -1))}"
}
