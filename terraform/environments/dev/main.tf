module "vpc" {

  source = "../../modules/vpc"

  name = var.vpc_name
  cidr = var.vpc_cidr

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  availability_zones = var.availability_zones

}

module "security" {

  source = "../../modules/security"

  vpc_id = module.vpc.vpc_id

  developer_ip = var.developer_ip

}

module "compute" {

  source = "../../modules/compute"

  ami_id = "ami-02bbe63d13ac78f61" # Your packer golden image

  cluster_name = module.eks.cluster_name

  subnet_ids = module.vpc.private_subnets

  security_group_id = module.security.app_sg

  instance_profile_name = module.iam.instance_profile_name

  target_group_arn = module.alb.target_group_arn

  environment = var.environment


}
module "alb" {

  source = "../../modules/alb"

  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets

  alb_sg = module.security.alb_sg

}

module "iam" {

  source = "../../modules/iam"

}

module "eks" {

  source = "../../modules/eks"

  cluster_name    = "mantra-cluster"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "rds" {

  source = "../../modules/rds"

  name            = "mantra"
  private_subnets = module.vpc.private_subnets

  db_username = "bhuvan"
  db_password = "Shweta143!$#"
}

module "efs" {

  source = "../../modules/efs"

  name            = "mantra"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}
