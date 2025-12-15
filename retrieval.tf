
# Retrieve the stored database credentials
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/ephemeral-resources/secretsmanager_secret_version
ephemeral "aws_secretsmanager_secret_version" "write_only_retrieved" {
  secret_id = aws_secretsmanager_secret.write_only_secret.id
  depends_on = [ aws_secretsmanager_secret_version.write_only_version ]
}

resource "aws_ssm_parameter" "retrieved_secret" {
  name  = "/${var.name}/retrieved_secret"
  type  = "SecureString"
  value_wo = ephemeral.aws_secretsmanager_secret_version.write_only_retrieved.secret_string
  value_wo_version = 1
  }