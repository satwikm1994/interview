# :page\_facing\_up: bastion

## Description
TF module to create bastion instance by using custom image

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_ids) | VPC Subnet ID to launch in | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of instance to start | `string` | n/a| yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Instance Profile to launch the instance with | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\vpc\_security\_group\_ids) | A list of security group IDs to associate with. | `string` | n/a | yes |
| <a name="availability_zone"></a> [availability\_zone](#input\availability\_zone) | AZ for the bastion instance | `string` | n/a | yes |
| <a name="owner_id"></a> [owner\_id](#input\owner\_id) | owner id of the image | `list(string)` | n/a | yes |
| <a name="bastion_image_name"></a> [bastion\_image\_name](#input\bastion\_image\_name) | bastion image name | `list(string)` | n/a | yes |
| <a name="virtualization_type"></a> [virtualization\_type](#input\virtualization\_type) | virtualization type | `list(string)` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\instance\_id) | bastion instance id |