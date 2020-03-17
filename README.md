# terraform-aws-iam-instance-profile
Terraform module for IAM instance profile to lunch instance with

# Terraform version
This module was written and tested with Terraform v0.12.20

# Assumptions
- You would like to create IAM profile to attache to EC2 instance (S3 access for example)
- You have access to AWS console where you can create you security credentials `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
- You configured your security credentials as your environment variables `~/.bash_profile` 

```bash
export AWS_ACCESS_KEY_ID=XXXX
export AWS_SECRET_ACCESS_KEY=XXXX
export AWS_DEFAULT_REGION=XXXX
```

# How to consume

```bash
git clone git@github.com:andrewpopa/terraform-aws-iam-profile.git
cd terraform-aws-iam-profile
```

- [`example`](https://github.com/andrewpopa/terraform-aws-iam-profile/tree/master/example) folder contain an example of how to consume the module


```hcl
module "iam-instance-policy" {
  source = "../"
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": ["s3:*"],
        "Resource": ["arn:aws:s3:::ptfe-external-svc-snapshot"]
      },
      {
        "Effect": "Allow",
        "Action": "s3:ListAllMyBuckets",
        "Resource": "arn:aws:s3:::*"
      }
    ]
  }
  EOF
}
```

# Inputs
| **Name**  | **Type** | **Default** | **Required** | **Description** |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| policy | string | none | yes | IAM policy for EC2 instance |


# Outputs
| **Name**  | **Type** | **Description** |
| ------------- | ------------- | ------------- |
| iam_instance_profile | string | IAM instance profile |