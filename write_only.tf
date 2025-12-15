# Write-Only Secret Pattern Demonstration
# This file demonstrates the write-only approach where secret values are not stored in Terraform state

# Generate ephemeral password for write-only demonstration
#https://registry.terraform.io/providers/hashicorp/random/latest/docs/ephemeral-resources/password
ephemeral "random_password" "write_only_password" {
  length           = 24
  override_special = "!#$%&*()-_=+[]{}:<>?"
}

# Create secret for write-only pattern
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret
resource "aws_secretsmanager_secret" "write_only_secret" {
  #checkov:skip=CKV2_AWS_57: This variable does not need to be rotated
  name                    = "/${var.name}/write_only_secret"
  recovery_window_in_days = 0
  kms_key_id              = aws_kms_key.local_key.id
}

# Write-only secret version - uses secret_string_wo
# The actual secret value will NOT appear in terraform state
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version
resource "aws_secretsmanager_secret_version" "write_only_version" {
  secret_id                = aws_secretsmanager_secret.write_only_secret.id
  secret_string_wo         = ephemeral.random_password.write_only_password.result
  secret_string_wo_version = 1
}