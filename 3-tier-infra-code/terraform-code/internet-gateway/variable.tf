variable "universe_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "vpc_name" {
  type = string
  description = "Name of the VPC"
}

variable "context" {
  description = "Subnet context (nodes/pods)"
  type        = string
}