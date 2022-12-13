# Include all settings from the root terragrunt.hcl file
# include {
#   path = find_in_parent_folders()
# }
# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/eks"
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
  nodes_cidrs = [
    "10.71.198.0/24",
    "10.71.199.0/24",
    "10.71.200.0/24"
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
