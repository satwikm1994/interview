terraform {
  source = ""
}

locals {
  vars          = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.vars.locals.universe_name
}

inputs = {
  endpoint_type = "Interface"
  service_names = [
    "com.amazonaws.ap-southeast-3.ec2messages",
    "com.amazonaws.ap-southeast-3.ssmmessages",
    "com.amazonaws.ap-southeast-3.ssm"
  ]
  context             = "nodes"
  security_group_name = "${local.universe_name}-ssm-endpoint"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
