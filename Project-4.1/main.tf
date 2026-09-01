module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source               = "./modules/compute"
  public-instance_type = var.public-instance_type
  public-instance_name = var.public-instance_name
  subnet_id            = module.networking.public_subnet_id
  security_group_ids   = [module.networking.security_group_id]
}
