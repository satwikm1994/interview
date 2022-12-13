terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//subnets?ref=master_v2"
  #source = "D:/aws-terraform/aws-modules/terraform-modules-aws/subnets"
}

inputs = {
  context  = "nodes"
  az_count = 3
  cidr_ids = ["10.70.198.0/24", "10.70.199.0/24", "10.70.200.0/24"]
  additional_tags = {
    "kubernetes.io/cluster/musca-cluster" = "owned"
    "kubernetes.io/role/internal-elb"     = "1"
  } #..> for private subnet
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}