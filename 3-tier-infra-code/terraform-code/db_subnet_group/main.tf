data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "db_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_${var.context}_*"
  }
}

locals {
  subnet_group_name_list = compact([var.universe_name, "db-subnet-group"])
  db_subnet_group_name   = join("-", local.subnet_group_name_list)
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = local.db_subnet_group_name
  description = "DB subnet group"
  subnet_ids  = data.aws_subnet_ids.db_subnets.ids

  tags = {
    Name = local.db_subnet_group_name
  }
}
