resource "aws_kms_key" "local_key" {
  description             = "KMS key for AWS Secrets Manager"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}