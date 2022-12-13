# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//iam?ref=master_v2"
}

locals {
myvars = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
universe_name = local.myvars.locals.universe_name
}
inputs = {
  eks_node              = true
  identifiers = ["ec2.amazonaws.com"]
  managed_policy_arns   = ["arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
   "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
   "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
   "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
   "arn:aws:iam::aws:policy/AmazonRDSFullAccess",
   "arn:aws:iam::aws:policy/SecretsManagerReadWrite"]
  eks_node_policy_name = "${local.universe_name}_EKS_autoscaling"
  instance_profile_name = "${local.universe_name}_eks_node_group_instance_profiles"
  instance_profile_role = "${local.universe_name}_eks_node_group_profile_roles"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
