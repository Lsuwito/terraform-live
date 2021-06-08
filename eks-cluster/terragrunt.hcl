terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//eks-cluster?ref=v0.0.19"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    public_subnet_ids = []
    private_subnet_ids = []
  }
}

inputs = {
  cluster_name               = "eks101"
  role                       = "sandbox-eks"
  subnet_ids                 = concat(dependency.vpc.outputs.public_subnet_ids, dependency.vpc.outputs.private_subnet_ids)
}
