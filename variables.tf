variable "name" {
  description = "Name to be used for instance"
  type        = string
}

variable "cpu_credits" {
  description = "The credit option for CPU usage (unlimited or standard)"
  type        = string
  default     = "standard"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  type        = string
  default     = "SSMRole"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = true
}

variable "aws_ami_owner" {
  description = "AMI owner id"
  type        = string
  default     = "099720109477"
}
variable "aws_ami_name_regex" {
  description = "AMI name regex"
  type        = string
  default     = "^.*ubuntu-bionic-18.04-amd64-server.*$"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}
