terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//subnets?ref=master_v2"
  #source = "D:/aws-terraform/aws-modules/terraform-modules-aws/subnets"
}

inputs = {
  context  = "public"
  az_count = 3
  cidr_ids = ["10.70.192.0/24", "10.70.193.0/24", "10.70.194.0/24"]
  additional_tags = {
    "kubernetes.io/cluster/musca-cluster" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
