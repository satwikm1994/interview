terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//db_subnet_group?ref=master_v2"
  #source = "D:/aws-terraform/aws-modules/terraform-modules-aws/db_subnet_group"
}

inputs = {
  context = "db"
}
# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
