#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret
resource "aws_secretsmanager_secret" "secret_one" {
  #checkov:skip=CKV2_AWS_57: This variable does not need to be rotated
  name                    = "secure_secret_one"
  recovery_window_in_days = 0
}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version
resource "aws_secretsmanager_secret_version" "secure_one_version" {
  secret_id     = aws_secretsmanager_secret.secret_one.id
  secret_string = var.SomeOtherSecret
  #The value is passed to the Terraform via the CLI
}

resource "aws_secretsmanager_secret" "db_secrets" {
  #checkov:skip=CKV2_AWS_57: This variable does not need to be rotated
  name                    = "environment/secrets"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_secrets_version" {
  secret_id     = aws_secretsmanager_secret.db_secrets.id
  secret_string = <<EOF
  {"username": "${var.username}","password":"${var.password}"}
  EOF
  #The value of the username and password are passed to Terraform via the CLI
}