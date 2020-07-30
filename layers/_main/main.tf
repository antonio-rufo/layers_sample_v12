/**
 * # Initialisation
 *
 * This layer is used to create a S3 bucket for remote state storage and to be used only for demo purposes.
 *
 * ### Create
 *
 * Update the `terraform.tfvars` file to include your required AWS access keys, AWS secret keys, AWS account ID, environment and region. This is just for the state bucket and not for where you are deploying your code so you can choose to place the bucket in a location closer to you than the target for the build.
 *
 * - update terraform.tfvars with your AWS access keys, AWS secret keys, AWS account ID, environment, and region
 *
 * ```bash
 * $ terraform init
 * $ terraform apply -auto-approve
 * ```
 *
 * ### Destroy
 *
 * ```bash
 * $ terraform destroy
 * ```
 *
 * When prompted, check the plan and then respond in the affirmative.
 */

provider "aws" {
  region              = var.region
  version             = "~> 2.0"
  allowed_account_ids = ["${var.aws_account_id}"]
}

locals {
  tags = {
    Environment     = "${var.environment}"
    ServiceProvider = "Rackspace"
    Terraform       = "true"
  }
}

resource "aws_s3_bucket" "state" {
  bucket        = "build-state-bucket-hkex-layers-demo"
  force_destroy = true

  tags = local.tags

  lifecycle_rule {
    id      = "Expire30"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }

    expiration {
      days = 30
    }
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
