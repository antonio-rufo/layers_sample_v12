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

locals {
  tags = {
    Environment     = "${var.environment}"
    ServiceProvider = "Rackspace"
    Layer           = var.layer
    Terraform       = "true"
  }
}

### S3 Bucket ###

resource "random_integer" "suffix" {
  min     = 1000
  max     = 9999
}

module "s3" {
  source = "../../../modules/aws-terraform-s3/"

  name          = "${var.s3_bucketname}-${random_integer.suffix.result}"
  bucket_acl    = var.s3_bucket_acl
  versioning    = var.s3_bucket_versioning
  environment   = var.environment
  sse_algorithm = var.s3_bucket_encryption
  tags          = "${local.tags}"
}
