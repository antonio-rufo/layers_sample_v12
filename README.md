# Demo Code

# Introduction

This demo code has 2 layers:
- 000base layer - creates the demo VPC Base Network with 2 public and 2 privates subnets
- 100data layer - creates a demo s3 bucket called  hello-world-hkex-<random suffix>

### Create

On each layer, kindly update the `terraform.tfvars` file to include your required AWS access key, AWS secret access key, AWS account ID, environment and region.

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
