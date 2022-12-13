# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//route53?ref=master_v2"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# KMS variables

locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
}
inputs = {
  vpc_name_list = ["norma-vpc"]
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
