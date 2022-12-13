# :page\_facing\_up: Network SUBNETS

## Description
TF module to add SUBNETS for our VPC

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
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional resource tags | `map(string)` | `{}` | no |
| <a name="input_az_count"></a> [az\_count](#input\_az\_count) | public availability zone count | `any` | n/a | yes |
| <a name="input_cidr_ids"></a> [cidr\_ids](#input\_cidr\_ids) | The CIDR range for the Subnet | `list(string)` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | Subnet context (nodes/pods) | `string` | n/a | yes |
| <a name="input_universe_name"></a> [universe\_name](#input\_universe\_name) | Universe Name | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The AWS vpc\_id to create things in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cidr_blocks"></a> [cidr\_blocks](#output\_cidr\_blocks) | List of cidr\_blocks of subnets create |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of subnets created |
| <a name="output_subnet_arns"></a> [subnet\_arns](#output\_subnet\_arns) | List of ARNs of subnets created |
