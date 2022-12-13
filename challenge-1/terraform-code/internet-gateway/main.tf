data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = "${var.universe_name}_${var.context}_*"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = "${var.universe_name}-internet-gateway"
  }
}

# Creating public route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = "${var.universe_name}-route-table-public"
  }
}

# Route the public subnet traffic through the IGW
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gw.id
}

# Associating public subnets with public routing table
resource "aws_route_table_association" "rt_asso_pub" {
  count          = length(data.aws_subnet_ids.public_subnets.ids)
  subnet_id      = sort(data.aws_subnet_ids.public_subnets.ids) [count.index]
  route_table_id = aws_route_table.public.id
}
