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
| [aws_route_table.private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_eip.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.nat_gw_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The id of the VPC network | `string` | n/a | yes |
| <a name="universe_name"></a> [universe\_name](#input\_universe\_name) | The name of the VPC network | `number` | n/a | yes |
| <a name="public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) |  number of public subnets | `list(string)` | n/a | yes |
| <a name="private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | number of private subnets | `list(string)` | n/a | yes |
| <a name="availability_zones"></a> [availability\_zones](#input\_availability\_zones) | number of  availability zones | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="private_route_table_ids"></a> [private\_route\_table\_ids](#output\private\_route\_table\_ids) | List of IDs of private route tables|
| <a name="nat_ids"></a> [nat\_ids](#output\nat\_ids) | List of allocation ID of Elastic IPs created for AWS NAT Gateway |
