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