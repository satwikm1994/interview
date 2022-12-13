terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/subnets"
}

inputs = {
  context         = "db"
  az_count        = 3
  cidr_ids        = ["10.71.195.0/24", "10.71.196.0/24", "10.71.197.0/24"]
  additional_tags = {} #..> for private subnet
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}