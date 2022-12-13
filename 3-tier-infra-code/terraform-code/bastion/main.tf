#below are custom kubectl image configurations.
data "aws_ami" "interview-bastion-image" {
  most_recent = true

  filter {
    name   = "name"
    values = var.bastion_image_name
  }

  filter {
    name   = "virtualization-type"
    values = var.virtualization_type
  }

  owners = var.owner_id

}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet" "subnet" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = var.subnet_name
  }
}

data "aws_security_groups" "selected" {
  filter {
    name   = "tag:Name"
    values = var.security_group_name
  }
}

data "aws_iam_instance_profile" "bastion_role" {
  name = var.bastion_profile_name
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.interview-bastion-image.id
  subnet_id                   = data.aws_subnet.subnet.id
  vpc_security_group_ids      = data.aws_security_groups.selected.ids
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.assign_public_id
  ebs_optimized               = true
  iam_instance_profile        = data.aws_iam_instance_profile.bastion_role.name
  user_data                   = file("ssm_agent.sh")

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name
  }

}