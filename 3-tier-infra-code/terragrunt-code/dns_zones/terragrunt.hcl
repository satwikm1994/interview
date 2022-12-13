# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/route53"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# KMS variables

locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
}
inputs = {
  vpc_name_list = ["interview-vpc"]
  aws_route53_zone_name = "${local.universe_name}.internal"
  create                = true
  records = [
    {
      name    = "webpage"
      type    = "CNAME"
      records = [""]
      ttl     = 3600
    }  ]
}


# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
