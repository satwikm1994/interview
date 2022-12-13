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
  identifiers = ["ec2.amazonaws.com"]
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"]
  instance_profile_name = "${local.universe_name}_bastion_instance_profile"
  instance_profile_role = "${local.universe_name}_bastion_profile_role"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
