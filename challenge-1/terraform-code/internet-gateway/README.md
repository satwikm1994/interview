# :page\_facing\_up: Network NAT

## Description
TF module to add NAT for our VPC

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
| [aws_internet_gateway.internet_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.internet_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table_association.rt_asso_pub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The id of the VPC network | `string` | n/a | yes |
| <a name="universe_name"></a> [universe\_name](#input\_universe\_name) | The name of the VPC network | `string` | n/a | yes |
| <a name="public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) |  subnet ids | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="igw_id"></a> [igw\_id](#output\igw\_id) | The ID of the Internet Gateway |
| <a name="igw_arn"></a> [igw\_arn](#output\igw\_arn) | The ARN of the Internet Gateway|
| <a name="public_route_table_ids"></a> [public\_route\_table\_ids](#output\public\_route\_table\_ids) | List of IDs of public route tables |
