data "aws_vpc" "custom" {
  id = var.vpc_id
}

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Tier"
    values = [var.target_subnet_tag]
  }
}

data "aws_caller_identity" "current" {}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.custom.id
  name   = "default"
}

data "aws_ami" "ubuntu_latest" {
  most_recent = true
  owners      = [var.aws_ami_owner]
  name_regex  = var.aws_ami_name_regex

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
