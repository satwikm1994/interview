# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
    region = "ap-south-1"
    # Only these AWS Account IDs may be operated on by this template
  }
  terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 4.34.0"
      }
    }
  }
  EOF
}

locals {
  universe_name = "interview"
}

inputs = {
  vpc_name       = "${local.universe_name}-vpc"
  universe_name  = "${local.universe_name}"
  network_name   = "${local.universe_name}-vpc"
  aws_account_id = <account_id>
  aws_region     = "ap-south-1"
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "interview-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    #key            = "terraform.tfstate"
    region         = "ap-south-1"

   }
   generate = {
     path      = "backend.tf"
     if_exists = "overwrite_terragrunt"
   }
 }
