terraform {
  backend "gcs" {}
}

locals {
  password = random_password.master_password[0].result
}

data "aws_kms_alias" "eks" {
  name = var.kms_name
}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_security_groups" "selected" {
  filter {
    name   = "tag:Name"
    values = var.security_group_name
  }
}

data "aws_iam_role" "rds_monitoring_role" {
  name = var.rds_instance_role_name
}

resource "aws_db_instance" "db_instance" {
  identifier                          = var.db_instance_name
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  allocated_storage                   = var.allocated_storage
  max_allocated_storage               = 5000
  kms_key_id                          = data.aws_kms_alias.eks.arn
  skip_final_snapshot                 = true
  storage_encrypted                   = true
  name                                = var.db_name
  username                            = var.db_username
  password                            = local.password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  maintenance_window                  = var.maintenance_window
  backup_retention_period             = var.backup_retention_period
  backup_window                       = var.backup_window #..> 09:46-10:16
  enabled_cloudwatch_logs_exports     = ["postgresql", "upgrade"]
  monitoring_interval                 = 30
  monitoring_role_arn                = data.aws_iam_role.rds_monitoring_role.arn
  performance_insights_enabled        = true
  vpc_security_group_ids              = data.aws_security_groups.selected.ids
  db_subnet_group_name                = var.db_subnet_group_name
  availability_zone                   = var.availability_zone
  multi_az                            = var.multi_az
}

resource "random_password" "master_password" {
  count   = 1
  length  = 16
  special = false
}

resource "aws_secretsmanager_secret" "secret" {
  name   = var.secret_name
  policy = var.policy
  tags   = var.tags
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = base64encode("postgres://${aws_db_instance.db_instance.username}:${local.master_password}@${aws_db_instance.db_instance.address}:5432/${aws_db_instance.db_instance.name}")
}