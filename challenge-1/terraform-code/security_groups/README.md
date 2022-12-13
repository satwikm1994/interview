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
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.endpoint_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.global_accelerator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.janus-media-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.packer_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rabbit_healthcheck](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rabbitmq_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds_ingress_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.turn-server-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_clickhouse_security_group"></a> [add\_clickhouse\_security\_group](#input\_add\_clickhouse\_security\_group) | Boolean value to create firewall rule for clickhouse | `bool` | n/a | yes |
| <a name="input_add_endpoints_security_group"></a> [add\_endpoints\_security\_group](#input\_add\_endpoints\_security\_group) | Boolean value to endpoint\_security\_group to allow https on 443 port | `bool` | n/a | yes |
| <a name="input_add_global_accelerator_security_group"></a> [add\_global\_accelerator\_security\_group](#input\_add\_global\_accelerator\_security\_group) | Boolean value to create firewall rule for global accelerator | `bool` | n/a | yes |
| <a name="input_add_influxdb_security_group"></a> [add\_influxdb\_security\_group](#input\_add\_influxdb\_security\_group) | Boolean value to create firewall rule to allow influx connections | `bool` | n/a | yes |
| <a name="input_add_janus_ms_security_group"></a> [add\_janus\_ms\_security\_group](#input\_add\_janus\_ms\_security\_group) | Boolean value to create firewall rule for janus ms | `bool` | n/a | yes |
| <a name="input_add_media_server_security_group"></a> [add\_media\_server\_security\_group](#input\_add\_media\_server\_security\_group) | Boolean value to create firewall rule to allow media server connections | `bool` | n/a | yes |
| <a name="input_add_packer_security_group"></a> [add\_packer\_security\_group](#input\_add\_packer\_security\_group) | For creating image through packer | `bool` | n/a | yes |
| <a name="input_add_rabbitmq_sg"></a> [add\_rabbitmq\_sg](#input\_add\_rabbitmq\_sg) | Boolean value to create rabbitmq securoty group | `bool` | n/a | yes |
| <a name="input_add_rds_ingress_security_group"></a> [add\_rds\_ingress\_security\_group](#input\_add\_rds\_ingress\_security\_group) | Boolean value to create firewall rule for RDS ingress to access traffic from private nodes CIDR | `bool` | n/a | yes |
| <a name="input_add_redis_security_group"></a> [add\_redis\_security\_group](#input\_add\_redis\_security\_group) | Boolean value to create firewall rule to allow redis connections | `bool` | n/a | yes |
| <a name="input_add_ssh_security_group"></a> [add\_ssh\_security\_group](#input\_add\_ssh\_security\_group) | Boolean value to create firewall rule to allow SSH | `bool` | n/a | yes |
| <a name="input_add_turn_server_security_group"></a> [add\_turn\_server\_security\_group](#input\_add\_turn\_server\_security\_group) | Boolean value to create firewall rule for janus ms | `bool` | n/a | yes |
| <a name="input_add_vault_security_group"></a> [add\_vault\_security\_group](#input\_add\_vault\_security\_group) | Boolean value to create firewall rule for vault | `bool` | n/a | yes |
| <a name="input_add_victoria_metrics_security_group"></a> [add\_victoria\_metrics\_security\_group](#input\_add\_victoria\_metrics\_security\_group) | Boolean value to create firewall rule to allow victoria metrics connections | `bool` | n/a | yes |
| <a name="input_db_cidr"></a> [db\_cidr](#input\_db\_cidr) | A list DB CIDR range belonging to private subnet | `list(string)` | `[]` | no |
| <a name="input_global_accelerator_cidr"></a> [global\_accelerator\_cidr](#input\_global\_accelerator\_cidr) | Global accelerator CIDR | `list(string)` | `[]` | no |
| <a name="input_nodes_cidr"></a> [nodes\_cidr](#input\_nodes\_cidr) | A list Nodes CIDR range belonging to private subnet | `list(string)` | `[]` | no |
| <a name="input_pods_cidr"></a> [pods\_cidr](#input\_pods\_cidr) | A list Pods CIDR range belonging to private subnet | `list(string)` | `[]` | no |
| <a name="input_universe_name"></a> [universe\_name](#input\_universe\_name) | universe name | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | vpc cidr blocks | `list(string)` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | vpc name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_sg_id"></a> [bastion\_sg\_id](#output\_bastion\_sg\_id) | Bastion security group id |
| <a name="output_endpoint_security_group_id"></a> [endpoint\_security\_group\_id](#output\_endpoint\_security\_group\_id) | Endpoint security group id |
