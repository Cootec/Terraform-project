#common values
region = "ap-south-1"
env = "project"
project_name = "terraform"

#VPC values
create_vpc = true
vpc_count = 1
cidr_block = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
public_subnet_count = 3
private_subnet_count = 3
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

#EKS values
create_eks_cluster = true
worker_node_counts = {
  "terraform-project-worker-node" = {
    desired = 1
    min     = 1
    max     = 1
    instance_types = "t3.medium"
  } 
}
ami_type = "AL2_x86_64"
cluster_name = "terraform-project-cluster"
capacity_type = "ON_DEMAND"
cluster_autoscaler_role = "eks-ca-role"
disk_size = "50"
lb_controller_role_name = "alb-controller-role"
instance_profile = "terraform-instance_profile"