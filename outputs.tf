output "ids" {
  description = "List of IDs of instances"
  value       = module.ec2.id
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2.public_dns
}

output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = module.ec2.vpc_security_group_ids
}
