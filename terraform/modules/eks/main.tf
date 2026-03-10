module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = var.cluster_name

  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  eks_managed_node_groups = {
    default = {
      instance_types = ["c7i-flex.large"]
      min_size       = 2
      max_size       = 3
      desired_size   = 2
    }
  }
}
