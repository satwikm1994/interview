locals {
  master_password = random_password.master_password[0].result
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.db_instance.*.address
}
#output "db_url" {
#  description = "The address of the RDS instance"
#  value       = "postgres://${aws_db_instance.db_instance.*.username}:${local.master_password}@${aws_db_instance.db_instance.*.address}:5432/${aws_db_instance.db_instance.*.name}"
#  sensitive   = true
#}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.db_instance.*.arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.db_instance.*.availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.db_instance.*.endpoint
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.db_instance.*.id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = aws_db_instance.db_instance.*.resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.db_instance.*.status
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.db_instance.*.name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.db_instance.*.username
}

output "db_instance_password" {
  description = "The master password"
  value       = local.master_password
  sensitive   = true
}

output "secret_manager_arn" {
  description = "Secret endpoint"
  value       = aws_secretsmanager_secret.secret.arn
}

output "secret_manager_name" {
  description = "Secret name"
  value       = aws_secretsmanager_secret.secret.name
}
