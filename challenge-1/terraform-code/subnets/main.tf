# Fetch AZs in the current region
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  count  = var.az_count
  vpc_id = data.aws_vpc.vpc.id
  #cidr_block = cidrsubnet(var.vpc_cidr, 4, var.pub_az_count + count.index)
  cidr_block        = element(var.cidr_ids, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    var.additional_tags,
    {
      Name = "${var.universe_name}_${var.context}_0${count.index + 1}"
    },
  )
}