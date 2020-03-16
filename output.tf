output "iam_instance_profile" {
  description = "IAM instance profile"
  value       = aws_iam_instance_profile.ec2_role.name
}