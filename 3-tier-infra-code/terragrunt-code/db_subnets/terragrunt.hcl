terraform {
  source = ""
}

inputs = {
  context         = "db"
  az_count        = 3
  cidr_ids        = ["10.70.195.0/24", "10.70.196.0/24", "10.70.197.0/24"]
  additional_tags = {} #..> for private subnet
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}