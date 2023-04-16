[![checkov-static-analysis-scan](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/code-scan.yml/badge.svg?branch=main)](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/code-scan.yml)
[![terraform-infra-provisioning](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/kunduso/add-aws-secretsmanager-terraform/actions/workflows/terraform.yml)
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
## License
This code is released under the Unlincse License. See [LICENSE](LICENSE).