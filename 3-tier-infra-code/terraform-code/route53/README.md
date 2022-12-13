# :page\_facing\_up: ROUTE53

## Description
TF module to create route53 for private dns

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
| [aws_route53_zone.idfy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.idfy-records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="aws_route53_zone_name"></a> [aws_route53_zone\_name](#input\_aws_route53_zone\_name) | Private zone name | `string` | n/a | yes |
| <a name="vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id's | `string` | n/a | yes |
| <a name="create"></a> [create](#input\_create) | create bool value | `bool` | n/a | yes |
| <a name="records"></a> [records](#input\_records) | records | `any` | n/a | yes |

