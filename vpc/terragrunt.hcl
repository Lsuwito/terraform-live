terraform {
  source = "git::git@github.com:Lsuwito/terraform-module.git//vpc?ref=v0.0.19"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_name                   = "sandbox-eks"
  vpc_cidr_block             = "10.0.2.0/24"
  private_subnet_cidr_blocks = ["10.0.2.0/26", "10.0.2.128/26"]
  public_subnet_cidr_blocks  = ["10.0.2.64/26", "10.0.2.192/26"]
}
