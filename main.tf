module "VPC" {
  source = "./modules/VPC"
  create_vpc = true
  cidr_block = var.cidr_block
  env = var.env
  project_name = var.project_name
  public_subnet_count = var.public_subnet_count
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_count = var.private_subnet_count
  private_subnet_cidrs = var.private_subnet_cidrs
  region = var.region
  availability_zones = var.availability_zones
}

module "eks"{
  source = "./modules/eks"
  region = var.region
  worker_node_counts = var.worker_node_counts
  cluster_name = var.cluster_name
  vpc_id = module.VPC.vpc_id
  project_name = var.project_name
  env = var.env
  capacity_type = "ON_DEMAND"
  ami_type = "AL2_x86_64"
  disk_size = "50"
  node_group_subnet = module.VPC.private_subnet_ids
  cluster_subnets = module.VPC.private_subnet_ids
  lb_controller_role_name = "alb-controller-role"
  cluster_autoscaler_role = "eks-ca-role"
  create_eks_cluster = true
  instance_profile = var.instance_profile
}
