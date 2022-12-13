# Include all settings from the root terragrunt.hcl file
# include {
#   path = find_in_parent_folders()
# }
# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//RDS?ref=master_v2"
  #source = "E:/terraform/terraform-modules-aws/RDS"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# Cloud SQL variables
locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
  db_name       = "hw-platform"
  db_context    = "hwplatform"
}

inputs = {
  kms_name                            = "alias/musca-db-key"
  rds_instance_role_name              = "${local.universe_name}_RDS_profile_role"
  db_instance_name                    = "${local.universe_name}-${local.db_context}-db"
  engine_version                      = "11.12"
  instance_class                      = "db.t3.micro"
  allocated_storage                   = 10
  db_name                             = "${local.db_context}_db"
  db_username                         = "${local.db_context}"
  iam_database_authentication_enabled = true
  security_group_name                 = ["${local.universe_name}-rds-ingress"]
  db_subnet_group_name                = "${local.universe_name}-db-subnet-group"
  multi_az                            = false
  availability_zone                   = "ap-southeast-3b"
  secret_name                         = "${local.universe_name}-${local.db_name}-db-url"
}

include {
  path = find_in_parent_folders()
}
