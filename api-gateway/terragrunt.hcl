terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//api-gateway?ref=v0.0.5"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "skitterbytes-api"
  cognito_user_pool_name = "skitterbytes"
}
