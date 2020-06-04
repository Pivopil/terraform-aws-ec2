locals {
  user_arn_elements = split("/", data.aws_caller_identity.current.arn)
  username = element(local.user_arn_elements, length(local.user_arn_elements) - 1)
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_caller_identity" "current" {}

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
