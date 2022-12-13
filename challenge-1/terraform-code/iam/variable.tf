variable "managed_policy_arns" {
  type        = list(string)
  description = "list of policy arns"
}

variable "instance_profile_name" {
  type        = string
  description = "instance profile name"
}

variable "instance_profile_role" {
  type        = string
  description = "instance profile Role name"
}

variable "identifiers" {
  type = list(string)
  description = "type of resource name"
}

variable "s3create" {
  type = bool
  description = "to create the s3 custom policy"
  default = false
}

variable "eks_node" {
  type = bool
  description = "to create the eks custom policy"
  default = false
}

variable "s3_policy_name" {
  type = string
  description = "s3 policy name"
  default     = null
}

variable "eks_node_policy_name" {
  type = string
  description = "eks node policy name"
  default     = null
}

