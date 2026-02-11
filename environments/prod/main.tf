provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "networking" {
  source            = "../../modules/networking"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "compute" {
  source             = "../../modules/compute"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.networking.target_group_arn
  alb_sg_id          = module.networking.alb_sg_id
}
