terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//kinesis-stream?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  stream_name = "skitterbytes-event"
}
