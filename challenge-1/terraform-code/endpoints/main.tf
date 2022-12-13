data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_security_group" "selected" {
  tags = {
    Name = var.security_group_name
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_${var.context}_*"
  }
}

resource "aws_vpc_endpoint" "ssm_endpoint" {
  count               = length(var.service_names)
  vpc_id              = data.aws_vpc.vpc.id
  service_name        = element(var.service_names, count.index)
  subnet_ids          = data.aws_subnet_ids.private_subnets.ids
  security_group_ids  = [data.aws_security_group.selected.id, ]
  private_dns_enabled = true
  vpc_endpoint_type   = var.endpoint_type

  tags = {
    Name = "${var.universe_name}-${element(var.service_names, count.index)}"
  }
}