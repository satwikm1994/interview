# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://gitlab.idfy.com/code/infra/terraform-modules-aws.git//bastion?ref=master_v2"
  
}

locals {
  myvars        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
  universe_name = local.myvars.locals.universe_name
}

inputs = {
  bastion_image_name   = ["idfy-norma-musca-bastion-image-1"]
  virtualization_type  = ["hvm"] #..> hvm or pv | doesn't hvm doesn't need any modification
  owner_id             = ["094550720335"]
  subnet_name          = "musca_nodes_01" #..> musca nodes subnet
  security_group_name  = ["musca-ssh"]
  instance_type        = "t3.nano" #..> 1 CPU | 6vCPU | 1GB Mem |
  bastion_profile_name = "norma_bastion_instance_profile"
  assign_public_id     = false
  availability_zone    = "ap-southeast-3a"
  instance_name        = "${local.universe_name}_bastion"
  volume_size          = 8
  volume_type          = "gp3"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}