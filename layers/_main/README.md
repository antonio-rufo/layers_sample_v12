# Initialisation

This layer is used to create a S3 bucket for remote state storage and to be used only for demo purposes.

### Create

Update the `terraform.tfvars` file to include your required AWS access keys, AWS secret keys, AWS account ID, environment and region. This is just for the state bucket and not for where you are deploying your code so you can choose to place the bucket in a location closer to you than the target for the build.

- update terraform.tfvars with your AWS access keys, AWS secret keys, AWS account ID, environment, and region

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
| environment | The name of the environment, e.g. Production, Development, etc. | string | `"Development"` | no |
| region | The AWS region the state should reside in. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| remote\_state\_configuration\_example | A suggested terraform block to put into the build layers |
| state\_bucket\_id | The ID of the bucket to be used for state files. |
| state\_bucket\_region | The region the state bucket resides in. |
| state\_import\_example | An example to use this layers state in another. |
