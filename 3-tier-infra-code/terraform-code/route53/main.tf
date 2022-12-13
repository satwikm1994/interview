terraform {
  backend "gcs" {}
}

locals {
  # terragrunt users have to provide `records` as jsonencode()'d string.
  # See details: https://github.com/gruntwork-io/terragrunt/issues/1211
  records = try(jsondecode(var.records), var.records)

  # Convert `records` from list to map with unique keys
  #
  # A list of `records` values is jsonencode()'d to a string to solve issue:
  # The true result value has the wrong type:
  # element types must all match for conversion to map.
  # Ref:
  # https://github.com/terraform-aws-modules/terraform-aws-route53/issues/47
  # https://github.com/terraform-aws-modules/terraform-aws-route53/pull/39

  recordsets = {
    for rs in local.records :
    join(" ", compact(["${rs.name} ${rs.type}", lookup(rs, "set_identifier", "")])) => merge(rs, {
      records = jsonencode(try(rs.records, null))
    })
  }
}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_vpcs" "vpcs" {
  filter {
    name = "tag:Name"
    values = var.vpc_name_list
  }
}

data "aws_vpc" "vpc_list" {
  count = length(data.aws_vpcs.vpcs.ids)
  id    = tolist(data.aws_vpcs.vpcs.ids)[count.index]
}

resource "aws_route53_zone" "primary_vpc" {
  name = var.aws_route53_zone_name
  vpc {
    vpc_id = data.aws_vpc.vpc.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone_association" "vpcs" {
  count = length(data.aws_vpcs.vpcs.ids)
  zone_id = aws_route53_zone.primary_vpc.zone_id
  vpc_id  = data.aws_vpc.vpc_list[count.index].id
}

resource "aws_route53_record" "idfy-records" {
  for_each = var.create ? local.recordsets : tomap({})

  zone_id = aws_route53_zone.primary_vpc.zone_id

  name    = each.value.name
  type    = each.value.type
  ttl     = lookup(each.value, "ttl", null)
  records = jsondecode(each.value.records)

  depends_on = [aws_route53_zone.primary_vpc]
}
