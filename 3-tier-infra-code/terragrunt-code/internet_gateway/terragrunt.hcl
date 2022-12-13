terraform {
  source = ""
}

inputs = {
  context = "public"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
