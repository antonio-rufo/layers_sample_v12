/**
 * # 100data layer
 */

provider "aws" {
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
  version             = "~> 2.17"
  region              = var.region
  allowed_account_ids = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {
    bucket  = "build-state-bucket-hkex-layers-demo"
    key     = "terraform.100data.tfstate"
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

data "terraform_remote_state" "_000base" {
  backend = "s3"

  config = {
    key    = "terraform.000base.tfstate"
    bucket = "build-state-bucket-hkex-layers-demo"
    region = "ap-southeast-2"
  }
}

locals {
  tags = {
    Environment     = "${var.environment}"
    ServiceProvider = "Rackspace"
    Layer           = var.layer
    Terraform       = "true"
  }
}

### S3 Bucket ###

module "s3" {
  source = "../../../modules/aws-terraform-s3/"

  name          = var.s3_bucketname
  bucket_acl    = var.s3_bucket_acl
  versioning    = var.s3_bucket_versioning
  environment   = var.environment
  sse_algorithm = var.s3_bucket_encryption
  tags          = "${local.tags}"
}
