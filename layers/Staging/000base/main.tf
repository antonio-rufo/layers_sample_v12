/**
 * # 000base layer
 */

provider "aws" {
  version             = "~> 2.7"
  region              = var.region
  allowed_account_ids = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {
    bucket  = "build-state-bucket-hkex-layers-demo"
    key     = "terraform.000base.tfstate"
    region  = "ap-southeast-2"
    encrypt = "true"
  }
}

data "terraform_remote_state" "main_state" {
  backend = "local"

  config = {
    path = "../../_main/terraform.tfstate"
  }
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
