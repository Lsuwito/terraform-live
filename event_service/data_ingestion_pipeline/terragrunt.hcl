terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//serverless_stream_processor?ref=v0.0.3"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  stream_name = "skitterbytes-event"
  function_name = "skitterbytes-event-processor"
  function_runtime = "go1.x"
  function_handler = "main"
  role = "event-service"
  deployment_package_bucket = "skitterbytes-us-west-2"
  deployment_package_key = "packages/event-processor.zip"
  alias = "prod"
}
