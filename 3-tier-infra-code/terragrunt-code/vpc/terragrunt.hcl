
terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr              = "10.71.192.0/18"
  secondary_cidr_blocks = ["10.135.0.0/16", "10.233.3.0/24"]
}
