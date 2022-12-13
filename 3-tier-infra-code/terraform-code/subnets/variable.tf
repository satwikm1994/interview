variable "az_count" {
  description = "public availability zone count"
  #default     = 3
}

variable "cidr_ids" {
  description = "The CIDR range for the Subnet"
  type        = list(string)
}

variable "universe_name" {
  description = "Universe Name"
  type        = string
}

variable "context" {
  description = "Subnet context (nodes/pods)"
  type        = string
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}