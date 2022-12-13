data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_security_group" "selected" {
  vpc_id = data.aws_vpc.vpc.id
  name   = "default"
}

#.........bastion security group....................
resource "aws_security_group" "allow_ssh" {
  count  = var.add_ssh_security_group == true ? 1 : 0
  name   = "${var.universe_name}-ssh"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr
    description = "Allow SSH"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound HTTPS from SSM connection"
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow inbound HTTPS from SSM connection"
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.db_cidr
    description = "Allow bastion outbound to RDS connection on port 5432"
  }

  egress {
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = var.nodes_cidr
    description = "Allow bastion outbound to RMQ connection on port 5672"
  }

  egress {
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = var.nodes_cidr
    description = "Allow bastion outbound to RMQ connection on port 15672"
  }

  egress {
    from_port   = 15692
    to_port     = 15692
    protocol    = "tcp"
    cidr_blocks = var.nodes_cidr
    description = "Allow bastion outbound to RMQ connection on port 15692"
  }

  tags = {
    Name = "${var.universe_name}-ssh"
  }
}

resource "aws_security_group" "endpoint_security_group" {
  count  = var.add_endpoints_security_group == true ? 1 : 0
  name   = "${var.universe_name}-endpoint"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr
    description = "Allow outbound HTTPS from SSM connection"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all port for outbound connection"
  }
  tags = {
    Name = "${var.universe_name}-ssm-endpoint"
  }
}

#...... RDS Ingress Security Group ........#
resource "aws_security_group" "rds_ingress_security_group" {
  count  = var.add_rds_ingress_security_group == true ? 1 : 0
  name   = "${var.universe_name}-rds-ingress"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = concat(var.pods_cidr, var.nodes_cidr)
    description = "Allow ingress traffic to RDS instance, only from private node CIDRs"
  }

  #..> no egress is required.

  tags = {
    Name = "${var.universe_name}-rds-ingress"
  }
}

