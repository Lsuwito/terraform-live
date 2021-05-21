terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//api-gateway?ref=master"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name                    = "skitterbytes-api"
  stage_name              = "prod"
  cognito_user_pool_name  = "skitterbytes"
  endpoint_type           = "REGIONAL"
  event_service_role_name = "event-service"
}
