variable "records" {
  description = "List of maps of DNS records"
  type        = any
  default     = []
}
variable "aws_route53_zone_name" {
  type        = string
  description = "Private zone name"
}

variable "vpc_name" {
  type = string
  description = "VPC name"
}

variable "vpc_name_list" {
  type = list(string)
  description = "other vpc names"
}

variable "create" {
  description = "Whether to create DNS records"
  type        = bool
  default     = true
}



