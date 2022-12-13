terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/subnets"
}

inputs = {
  context  = "public"
  az_count = 3
  cidr_ids = ["10.71.192.0/24", "10.71.193.0/24", "10.71.194.0/24"]
  additional_tags = {
    "kubernetes.io/cluster/interview-cluster" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
