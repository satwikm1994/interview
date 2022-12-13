resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_cidr
  # tenancy instance for dedicated hardware if needed uncomment (cost 2$/hour)
  #instance_tenancy = "dedicated"
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = {
    Name = var.vpc_name
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  count      = length(var.secondary_cidr_blocks)
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = element(var.secondary_cidr_blocks, count.index)
}

resource "aws_default_route_table" "main_route_table" {
  default_route_table_id = aws_vpc.vpc_main.default_route_table_id
  tags = {
    Name = "${var.universe_name}-route-table-private"
  }
}