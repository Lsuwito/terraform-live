terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//ec2?ref=v0.0.20"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    public_subnet_ids = ["fake-public-subnet-id"]
    private_subnet_ids = ["fake-private-subnet-id"]
    bastion_security_group_id = "fake-sg-id"
  }
}

inputs = {
  ami = "ami-04071714ae6bc5aa7"
  subnet_id = dependency.vpc.outputs.public_subnet_ids[0]
  security_group_ids = [dependency.vpc.outputs.bastion_security_group_id]
}
