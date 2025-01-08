[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-white.svg)](https://choosealicense.com/licenses/unlicense/)[![GitHub pull-requests closed](https://img.shields.io/github/issues-pr-closed/kunduso/add-aws-secretsmanager-terraform)](https://github.com/kunduso/add-aws-secretsmanager-terraform/pulls?q=is%3Apr+is%3Aclosed)[![GitHub pull-requests](https://img.shields.io/github/issues-pr/kunduso/add-aws-secretsmanager-terraform)](https://GitHub.com/kunduso/add-aws-secretsmanager-terraform/pull/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/kunduso/add-aws-secretsmanager-terraform)](https://github.com/kunduso/add-aws-secretsmanager-terraform/issues?q=is%3Aissue+is%3Aclosed)[![GitHub issues](https://img.shields.io/github/issues/kunduso/add-aws-secretsmanager-terraform)](https://GitHub.com/kunduso/add-aws-secretsmanager-terraform/issues/)
[![terraform-infra-provisioning](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/terraform.yml) [![checkov-static-analysis-scan](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/code-scan.yml/badge.svg?branch=main)](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/code-scan.yml) [![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/06af6e89-01e0-4bb5-bf85-ea19a0d3327a/repos/44494c82-27a6-4cdf-8459-684ac917c087/branch/fd28702f-2533-4949-8bc7-311d320d5265)](https://dashboard.infracost.io/org/skundudev/repos/44494c82-27a6-4cdf-8459-684ac917c087?tab=settings)
![Image](https://skdevops.files.wordpress.com/2023/04/74-image-1.png)
## Motivation
An AWS Secrets Manager secret is a resource to store secure credentials. In the past, I created an AWS Secrets Manager resource using Terraform from my laptop. I did this by storing the secret value in the `tfvars` file and ensuring that the `tfvars` file is not part of the repository using the `.gitignore` file. Since the secret value was not committed to the repository, the approach worked fine in that case. However, how do you do that when provisioning resources with secure values via a pipeline using Terraform configuration code? Enter Github Actions secrets - a secure information transfer mechanism for GitHub Actions pipelines. 
<br />In this repository , I store the Terraform configuration and GitHub Actions YAML pipeline to create an AWS Secrets manager secret. If you want to read the detailed documentation around this, [click here.](https://skundunotes.com/2023/04/16/create-aws-secrets-manager-secret-using-terraform-secure-variables-and-github-actions-secrets/)

## Prerequisites
Before working on this use case, please understand two critical concepts associated with deploying Terraform configuration to the AWS cloud using GitHub actions.
<br />Concept#1: [Securely integrate AWS Credentials with GitHub Actions using OpenID Connect](https://skundunotes.com/2023/02/28/securely-integrate-aws-credentials-with-github-actions-using-openid-connect/)
<br />Concept#2: [CI-CD with Terraform and GitHub Actions to deploy to AWS](https://skundunotes.com/2023/03/07/ci-cd-with-terraform-and-github-actions-to-deploy-to-aws/)
## Usage
Review the code including the [`terraform.yml`](./.github/workflows/terraform.yml) to understand the steps in the GitHub Actions pipeline. Also review the `terraform` code to understand all the concepts associated with creating an AWS Secrets Manager secret.
<br/>I also have a static code analysis enabled in this repository using Checkov. The scan result is accessible at [checkov-scan.](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/code-scan.yml)
<br/>If you want to learn more about how to enable Checkov static analysis checks for `terraform` code in your repository, you may read that at [automate-terraform-configuration-scan-with-checkov-and-github-actions.](http://skundunotes.com/2023/04/12/automate-terraform-configuration-scan-with-checkov-and-github-actions/)
<br />If you want to check the pipeline logs, click on the **Build Badge** (terrform-infra-provisioning) above the image in this ReadMe.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.local_key](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/kms_key) | resource |
| [aws_secretsmanager_secret.db_secrets](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret.secret_one](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.db_secrets_version](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/secretsmanager_secret_version) | resource |
| [aws_secretsmanager_secret_version.secure_one_version](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SomeOtherSecret"></a> [SomeOtherSecret](#input\_SomeOtherSecret) | Some other secret | `string` | `""` | no |
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | The access\_key that belongs to the IAM user | `string` | `""` | no |
| <a name="input_password"></a> [password](#input\_password) | The password of the entity | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Infrastructure region | `string` | `"us-east-2"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | The secret\_key that belongs to the IAM user | `string` | `""` | no |
| <a name="input_username"></a> [username](#input\_username) | The username of the entity | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
## Contributing
If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request. Contributions are always welcome!
## License
This code is released under the Unlicense License. See [LICENSE](LICENSE).