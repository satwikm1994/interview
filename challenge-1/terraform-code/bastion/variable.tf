variable "bastion_image_name" {
  description = "bastion image name"
  type        = list(string)
}

variable "virtualization_type" {
  description = "virtualization type"
  type        = list(string)
}

variable "owner_id" {
  description = "owner id of the image"
  type        = list(string)
}

variable "universe_name" {
  description = "universe name"
  type        = string
}

variable "security_group_name" {
  description = "security_group_ids for bastion machine"
  type        = list(string)
}

variable "instance_type" {
  type        = string
  description = "Type of instance to start"
}

variable "bastion_profile_name" {
  type        = string
  description = "IAM Instance Profile to launch the instance with"
}

variable "availability_zone" {
  description = "AZ for the bastion instance"
  type        = string
}

variable "assign_public_id" {
  description = "Assign a Public IP?"
  type        = bool
  default     = false
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}

variable "subnet_name" {
  type        = string
  description = "name of the subnet"
}

variable "instance_name" {
  type        = string
  description = "Tag name given to instnace"
}

variable "volume_size" {
  description = "The size of the drive in GiBs"
  type        = number
}

variable "volume_type" {
  description = "The type of amazon EBS volume used"
  type        = string
}