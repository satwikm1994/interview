terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/db_subnet_group"
}

inputs = {
  context = "db"
}
# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
