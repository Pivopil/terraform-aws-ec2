provider "aws" {
}

module "ec2" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "2.13.0"
  instance_count = var.instance_count

  name                        = var.name
  ami                         = data.aws_ami.ubuntu_latest.id
  instance_type               = var.instance_type
  cpu_credits                 = var.cpu_credits
  subnet_id                   = tolist(data.aws_subnet_ids.all.ids)[0]
  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  tags = {
    username: local.username
  }
}
