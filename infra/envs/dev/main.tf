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