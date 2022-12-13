variable "alias_name" {
  description = "The name of the key alias"
  type        = string
}

variable "deletion_window_in_days" {
  description = "The duration in days after which the key is deleted after destruction of the resource"
  type        = string
}

variable "description" {
  description = "The description of this KMS key"
  type        = string
}

#variable "iam_policy" {
#  description = "The policy of the key usage"
#  type        = string
#}

variable "is_enabled" {
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
  type        = bool
}

variable "enable_key_rotation" {
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
}

variable "customer_master_key" {
  description = "custom master key"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}
