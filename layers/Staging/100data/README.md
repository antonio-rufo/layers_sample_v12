# 100data Layer

# Initialisation

This layer will create a demo S3 bucket.

### Create

Update the `terraform.tfvars` file to include your required AWS access key, AWS secret access key, AWS account ID, environment and region.

- update terraform.tfvars with your AWS access key, AWS secret access key, AWS account ID, environment and region

```bash
$ terraform init
$ terraform apply -auto-approve
```

### Destroy

```bash
$ terraform destroy
```

When prompted, check the plan and then respond in the affirmative.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_access\_key | The AWS access key of the AWS account. | string | n/a | yes |
| aws\_secret\_key | The AWS secret key of the AWS account. | string | n/a | yes |
| aws\_account\_id | The account ID you are building into. | string | n/a | yes |
| region | The AWS region the state should reside in. | string | n/a | yes |
| environment | The name of the environment, e.g. Production, Development, etc. | string | n/a | yes |
| layer | The name of the layer. | string | n/a | yes |
| s3\_bucketname | The name of the S3 bucket for the access logs. The bucket name can contain only lowercase letters, numbers, periods (.), and dashes (-). Must be globally unique. If changed, forces a new resource. | string | n/a | yes |
| s3\_bucket\_acl | Bucket ACL. Must be either authenticated-read, aws-exec-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write, private, public-read or public-read-write. | string | "bucket-owner-full-control" | no |
| s3\_bucket\_versioning | Enable bucket versioning. i.e. true | string | false | no |
| s3\_bucket\_encryption | The server-side encryption algorithm to use. Valid values are AES256, aws:kms, and none. | string | "AES256" | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | The name of the bucket. |
| bucket\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
