# 000base Layer

# Initialisation

This layer will create your VPC Base Network with 2 Private and 2 Public Subnets to be used for demo.

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
| vpc\_name | The name of the VPC. | string | n/a | yes |
| cidr\_range | CIDR range for the VPC | string | n/a | yes |
| private\_subnets | An array of CIDR ranges to use for private subnets | list | n/a | yes |
| public\_subnets | An array of CIDR ranges to use for public subnets | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| base\_network\_nat\_gateway\_eip | The NAT gateway EIP(s) of the Base Network. |
| base\_network\_private\_route\_tables | The private route tables of the Base Network. |
| base\_network\_private\_subnets | The private subnets of the Base Network. |
| base\_network\_public\_route\_tables | The public route tables of the Base Network. |
| base\_network\_public\_subnets | The public subnets of the Base Network. |
| base\_network\_vpc\_id | The VPC ID of the Base Network. |
