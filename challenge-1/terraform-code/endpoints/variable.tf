variable "service_names" {
  type        = list(string)
  description = "list of service names"
}

variable "vpc_name" {
  type        = string
  description = "vpc Name"
}

variable "universe_name" {
  type        = string
  description = "Universe Name"
}

variable "context" {
  type        = string
  description = "context (db)"
}

variable "endpoint_type" {
  type        = string
  description = "endpoint_type"
}

variable "security_group_name" {
  type = string
  description = "security_group_name"
}
