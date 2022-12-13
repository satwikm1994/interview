terraform {
  backend "gcs" {}
}

resource "aws_kms_key" "kms_key" {
  description              = var.description
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = var.customer_master_key
  # policy                  = var.iam_policy
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_alias" "kms_alias" {
  name          = var.alias_name
  target_key_id = aws_kms_key.kms_key.id
}
