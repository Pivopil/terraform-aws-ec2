locals {
  user_arn_elements = split("/", data.aws_caller_identity.current.arn)
  username          = element(local.user_arn_elements, length(local.user_arn_elements) - 1)
  user_data         = <<EOF
#!/bin/bash
sudo apt update
sudo apt install -y mysql-server awscli
cd /tmp
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
EOF
}
