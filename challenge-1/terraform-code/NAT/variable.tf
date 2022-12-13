variable "vpc_name" {
  type = string
  description = "Name of the VPC"
}

variable "universe_name" {
  type        = string
  description = "Universe Name"
}

variable "availability_zones" {
  type = list(string)
}

