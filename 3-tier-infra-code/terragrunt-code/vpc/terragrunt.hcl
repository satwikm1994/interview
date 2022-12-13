
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//vpc?ref=master_v2"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr              = "10.70.192.0/18"
  secondary_cidr_blocks = ["10.134.0.0/16", "10.232.3.0/24"]
}
