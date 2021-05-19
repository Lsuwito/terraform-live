locals {
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  aws_region = local.region_vars.locals.aws_region
}

# Instruct Terragrunt to the generate the aws provider configuration block in provider.tf.
# Use the include block with path equals to find_in_parent_folders function in the module to include this configuration. 
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  default_tags {
    tags = {
      ProvisionedBy = "Terraform"
    }
  }
}
EOF
}

# Instruct Terragrunt to generate remote state configuration block in backend.tf
# Use the include block with path equals to find_in_parent_folders function in the module to use this configuration.
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    encrypt = true
    bucket  = "skitterbytes-tf-state-${local.aws_region}"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = local.aws_region
  }
}
