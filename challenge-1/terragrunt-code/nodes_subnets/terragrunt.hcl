terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/subnets"
}

inputs = {
  context  = "nodes"
  az_count = 3
  cidr_ids = ["10.71.198.0/24", "10.71.199.0/24", "10.71.200.0/24"]
  additional_tags = {
    "kubernetes.io/cluster/interview-cluster" = "owned"
    "kubernetes.io/role/internal-elb"     = "1"
  } #..> for private subnet
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}