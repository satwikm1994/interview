variable "cluster_name" {
  type        = string
  description = "eks cluster name"
}

variable "kms_name" {
  type        = string
  description = "KMS name for encryption of secrets"
}

variable "enable_vpc_cni_addon" {
  type        = bool
  description = "Enable VPC CNI Addon"
  default     = false
}

variable "vpc_cidr" {
  type        = list(string)
  description = "The name of the VPC network"
}

variable "cluster_egress_cidrs" {
  description = "List of CIDR blocks that are permitted for cluster egress traffic."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "services_cidr" {
  type        = string
  description = "The CIDR block to assign Kubernetes service IP addresses from"
}

variable "public_access_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks which can access Amazon EKS public API server endpoint"
}

variable "nodes_cidrs" {
  type        = list(string)
  description = "List of Node CIDR blocks which can access Amazon EKS public API server endpoint"
}

#variable "public_cidr_ranges" {
#  description = "list of public subnet cidr ranges"
#  type        = list(string)
#}

variable "node_group" {
  type = map(object({
    node_group_name = string
    instance_family = list(string)
    min_size        = number
    max_size        = number
    desired_size    = number

  }))
  description = "Node pool details"
}

variable "vpc_name" {
  type = string
  description = "Name of the VPC"
}

variable "universe_name" {
  description = "Universe Name"
  type        = string
}

variable "context" {
  description = "Subnet context (nodes/pods)"
  type        = string
}

variable "eks_cluster_role_name" {
  type = string
  description = "cluster role name"
}

variable "eks_node_group_role_name" {
  type  = string
  description = "node group name"
}