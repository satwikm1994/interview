variable "cluster_name" {
  type        = string
  description = "eks cluster name"
}

variable "user_arn" {
  type        = string
  description = "For creating node level roles"
}