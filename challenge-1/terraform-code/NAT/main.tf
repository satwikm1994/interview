data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_nodes_*"
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_public_*"
  }
}

data "aws_route_table" "selected" {
 tags = {
    Name = "${var.universe_name}-route-table-private"
  }
}

# Creating a EIP & NAT gateway
resource "aws_eip" "public" {
  count = length(var.availability_zones)
  vpc   = true
}

resource "aws_nat_gateway" "nat_gw" {
  count         = length(var.availability_zones)
  allocation_id = element(aws_eip.public.*.id, count.index)
  subnet_id     = sort(data.aws_subnet_ids.public_subnets.ids) [count.index]
  tags = {
    Name = "${var.universe_name}-nat-gateway"
  }
}

# Creating private route table for private subnets
#resource "aws_route_table" "private" {
#  count  = length(var.availability_zones)
#  vpc_id = var.vpc_id
#  tags = {
#    Name = "${var.universe_name}_aws_route_table_private_${count.index + 1}"
#  }
#}

resource "aws_route" "nat_gw_route" {
  count = length(var.availability_zones)
  #route_table_id         = element(aws_route_table.private.*.id, count.index)
  route_table_id         = data.aws_route_table.selected.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gw.*.id, count.index)
}

# Associating private subnets with private routing table
resource "aws_route_table_association" "rt_asso_priv" {
  count          = length(data.aws_subnet_ids.private_subnets.ids)
  subnet_id      = sort(data.aws_subnet_ids.private_subnets.ids) [count.index]
  route_table_id = data.aws_route_table.selected.id
}