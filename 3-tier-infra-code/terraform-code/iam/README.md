# :page\_facing\_up: IAM

## Description
TF module to create IAM roles

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.Packer_ec2_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_instance_profile.interview_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="managed_policy_arns"></a> [managed_policy\_arn](#input\_managed_policy\_arn) | list of policy arns | `list(string)` | n/a | yes |
