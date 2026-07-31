provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source  = "../../modules/network"
  project = "devops-lab"
}

module "ecr" {
  source  = "../../modules/ecr"
  project = "devops-lab"
}

module "alb" {
  source             = "../../modules/alb"
  project            = "devops-lab"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
}

module "ecs" {
  source                 = "../../modules/ecs"
  project                = "devops-lab"
  region                 = "ap-south-1"
  vpc_id                 = module.network.vpc_id
  public_subnet_ids      = module.network.public_subnet_ids
  ecr_repository_url     = module.ecr.repository_url
  target_group_arn       = module.alb.target_group_arn
  alb_security_group_id  = module.alb.alb_security_group_id
}