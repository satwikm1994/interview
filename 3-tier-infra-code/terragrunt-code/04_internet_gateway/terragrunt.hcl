terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//internet-gateway?ref=master_v2"
  #source = "D:/aws-terraform/aws-modules/terraform-modules-aws/internet-gateway"
}

inputs = {
  context = "public"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
