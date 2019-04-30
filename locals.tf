locals {
  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }

  # Generate prefix, truncate it to 21 characters and add "-kv" suffix
  name_prefix = "${var.stack}-${var.client_name}-${var.environment}"
  name        = "${coalesce(var.custom_name, replace(substr(local.name_prefix, 0, length(local.name_prefix) > 21 ? 20 : -1), "/-?$/", "-kv"))}"
}
