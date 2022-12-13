terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//NAT?ref=master_v2"
  #source = "D:/aws-terraform/aws-modules/terraform-modules-aws/NAT"
}


inputs = {
  availability_zones = ["ap-south-1"]
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
