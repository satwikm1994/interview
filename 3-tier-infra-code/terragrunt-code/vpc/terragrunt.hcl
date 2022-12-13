
terraform {
  source = ""
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr              = "10.70.192.0/18"
  secondary_cidr_blocks = ["10.134.0.0/16", "10.232.3.0/24"]
}
