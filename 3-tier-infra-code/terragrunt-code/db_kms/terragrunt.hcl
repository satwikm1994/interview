# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//KMS?ref=master_v2"
  
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# KMS variables
inputs = {
  alias_name              = "alias/interview-db-key"
  deletion_window_in_days = "7" #..> days
  description             = "KMS key for RDS"
  enable_key_rotation     = true
  is_enabled              = true
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
