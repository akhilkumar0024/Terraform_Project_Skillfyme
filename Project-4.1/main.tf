locals {
  # CIDR blocks per workspace
  vpc_cidrs = {
    default = "10.0.0.0/16"
    dev     = "10.0.0.0/16"
    staging = "10.1.0.0/16"
    prod    = "10.2.0.0/16"
  }

  subnet_cidrs = {
    default = "10.0.1.0/24"
    dev     = "10.0.1.0/24"
    staging = "10.1.1.0/24"
    prod    = "10.2.1.0/24"
  }

  # Types as per workspace (t3.small for dev/staging, t3.medium for prod)
  instance_types = {
    default = "t3.small"
    dev     = "t3.small"
    staging = "t3.medium"
    prod    = "t3.medium"
  }
}

module "networking" {
  source      = "./modules/networking"
  environment = terraform.workspace
  vpc_cidr    = lookup(local.vpc_cidrs, terraform.workspace, "10.0.0.0/16")
  subnet_cidr = lookup(local.subnet_cidrs, terraform.workspace, "10.0.1.0/24")
}

module "compute" {
  source               = "./modules/compute"
  environment          = terraform.workspace
  public-instance_type = lookup(local.instance_types, terraform.workspace, "t2.micro")
  public-instance_name = "${terraform.workspace}-server"
  subnet_id            = module.networking.public_subnet_id
  security_group_ids   = [module.networking.security_group_id]
}
