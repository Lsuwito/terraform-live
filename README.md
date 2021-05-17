# Provisioning AWS Cloud Infrastructure Using Terraform

This repository contains some code to deploy my AWS resources into my sandbox environment. They are using the modules from [my terraform-module repo](https://github.com/Lsuwito/terraform-module).

Prerequisites:
1. Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform) 
2. Install [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install)
3. Create S3 bucket to store the Terraform state and enable versioning.


## Why use Terragrunt?
Terragrunt provides features that allow us to reuse remote state configuration, provider configuration, and common variables.


