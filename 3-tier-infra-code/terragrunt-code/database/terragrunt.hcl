terraform {
  source = "git::https://github.com/satwikm1994/interview.git/3-tier-infra-code/terraform-code/RDS"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# Cloud SQL variables
locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
  db_name       = "interview-db"
  db_context    = "interview"
}

inputs = {
  kms_name                            = "alias/interview-db-key"
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
  availability_zone                   = "ap-south-1"
  secret_name                         = "${local.universe_name}-${local.db_name}-db-url"
}

include {
  path = find_in_parent_folders()
}
