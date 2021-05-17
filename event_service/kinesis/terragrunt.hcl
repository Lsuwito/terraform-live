terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//kinesis_stream"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  stream_name = "skitterbytes-event"
}
