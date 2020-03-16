resource "aws_iam_role" "ec2_role" {
  name               = "ec2_role_name"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "ec2_role" {
  name = "ec2_role"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  name   = "ec2-role-policy"
  role   = aws_iam_role.ec2_role.id
  policy = var.policy
}