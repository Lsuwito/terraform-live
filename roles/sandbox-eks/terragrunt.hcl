terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//service-iam-role?ref=v0.0.18"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  role_name = "sandbox-eks"
  aws_services = ["eks.amazonaws.com"]
  managed_policies = ["AmazonEKSClusterPolicy"]
}
