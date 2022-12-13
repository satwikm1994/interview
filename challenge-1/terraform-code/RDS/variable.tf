variable "rds_instance_role_name" {
  type        = string
  description = "rds monitoring profile name"
}

variable "db_instance_name" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = "interview-db"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "11.5"
}

variable "maintenance_window" {
  description = "Maintenance weekly time interval"
  type        = string
  default     = "Sat:18:30-Sun:00:30"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = "50"
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = "interview-subnetgroup"
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = null
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "kms_name" {
  description = "The ARN for the KMS encryption key for DB. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type        = string
}

variable "policy" {
  default     = null
  description = "Optional. The resource policy which controls access to the secret."
}

variable "tags" {
  default     = {}
  description = "User-Defined tags"
  type        = map(string)
}

variable "secret_name" {
  description = "Name of secret to store"
  type        = string
}

variable "backup_retention_period" {
  description = "Backup Retention Period Frequence value can be 0-25"
  type        = string
  default     = "7"
}

variable "backup_window" {
  description = "Daily backup window range in UTC should not overlap with maintenance_window, example: 09:46-10:16"
  type        = string
  default     = "02:00-03:00"
}

variable "security_group_name" {
  description = "security group name for rds"
  type        = list(string)
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}