# Please input aws_access_key, aws_secret_key, and aws_account_id.

aws_access_key = "XXXXX"
aws_secret_key = "XXXXX"
aws_account_id = "XXXXX"
region         = "ap-southeast-2"
environment    = "Staging"
layer          = "000base"

##### VPC details #####

vpc_name = "Base-Network-Staging"

cidr_range = "10.10.0.0/21"

private_subnets = [
  "10.10.3.0/24",
  "10.10.4.0/24",
]

public_subnets = [
  "10.10.0.0/24",
  "10.10.1.0/24",
]
