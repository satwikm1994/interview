terraform {
  source = ""
}


inputs = {
  availability_zones = ["ap-south-1"]
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
