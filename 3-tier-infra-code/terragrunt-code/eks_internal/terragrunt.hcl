# Include all settings from the root terragrunt.hcl file
# include {
#   path = find_in_parent_folders()
# }
# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = ""
}

locals {
  universe_name = "interview"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# GKE variables
inputs = {
  cluster_name             = "${local.universe_name}-cluster"
  kms_name                 = "alias/interview-cluster-key-ring"
  enable_vpc_cni_addon     = false
  cluster_egress_cidrs     = ["0.0.0.0/0"]
  eks_node_group_role_name = "interview_eks_node_group_profile_roles"
  eks_cluster_role_name    = "interview_eks_cluster_profile_roles"
  services_cidr            = "10.232.1.0/24"
  public_access_cidrs = [
    "35.200.180.154/32", // Gitlab NAT
    "35.244.32.83/32",   // Shared Prod
    "34.93.185.58/32"    // Shared Prod
  ]
  nodes_cidrs = [
    "10.70.198.0/24",
    "10.70.199.0/24",
    "10.70.200.0/24"
  ]
  context = "nodes" #..> interview nodes subnet
  node_group = {
    "node_group_1" = {
      node_group_name = "${local.universe_name}-cluster-group"
      desired_size    = 1
      max_size        = 2
      min_size        = 1
      instance_family = ["m5.xlarge"]
    },
  }
}

include {
  path = find_in_parent_folders()
}
