/**
 * # 000base layer
 */

provider "aws" {
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
  version             = "~> 2.7"
  region              = var.region
  allowed_account_ids = ["${var.aws_account_id}"]
}

locals {
  tags = {
    Environment     = var.environment
    ServiceProvider = "Rackspace"
    Layer           = var.layer
    Terraform       = "true"
  }
}

######## Base Network setup ########

module "base_network" {
  source = "../../../modules/aws-terraform-vpc_basenetwork/"

  az_count            = length(var.private_subnets)
  build_flow_logs     = "false"
  cidr_range          = var.cidr_range
  tags                = "${local.tags}"
  environment         = var.environment
  private_cidr_ranges = var.private_subnets
  public_cidr_ranges  = var.public_subnets
  name                = var.vpc_name
}
