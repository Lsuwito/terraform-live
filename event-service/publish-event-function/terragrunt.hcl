terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//lambda?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  function_name = "skitterbytes-event-processor"
  function_runtime = "go1.x"
  function_handler = "main"
  role = "event-service"
  deployment_package_bucket = "skitterbytes-us-west-2"
  deployment_package_key = "packages/event-processor.zip"
  alias = "prod"
}
