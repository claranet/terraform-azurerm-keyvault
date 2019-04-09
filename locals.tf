locals {
  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }

  name = "${coalesce(var.custom_name, "${var.stack}-${var.client_name}-${var.environment}-kv")}"
}
