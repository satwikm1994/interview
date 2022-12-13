variable "vpc_cidr" {
  description = "The AWS vpc range"
}

variable "vpc_name" {
  description = "The name of the VPC network"
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "universe_name" {
  type        = string
  description = "The name of the VPC network"
}
