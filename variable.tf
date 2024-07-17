variable "env" {
  description = "Name of environment"
  type = string  
}

variable "region" {
  description = "Region where the infra to be created"
  type = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string  
}

#VPC values
variable "vpc_count" {
  type = number
  default = null
}

variable "create_vpc" {
  description = "Flag to determine whether to create the VPC or not"
  type        = bool
  default     = false  
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = null
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = null
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = null
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = []
}

#ACM value
variable "domain_name" {
  type = string
  default = null
}

#EKS value
variable "cluster_name" {
  description = "Name for the EKS cluster"
  type        = string
  default = null
}

variable "capacity_type" {
  description = "Capacity type of EKS worker node"
  type = string
  default = null
  }

variable "ami_type" {
  description = "AMI type of EKS worker node"
  type = string
  default = null
}

variable "worker_node_counts" {
  description = "Map of counts for EKS worker nodes"
  type        = map(object({
    desired = number
    min     = number
    max     = number
    instance_types = string
  }))
}

variable "disk_size" {
  description = "Disk size of EKS worker node"
  type = string
  default = null
}

variable "lb_controller_role_name" {
  description = "LB controller name of the IAM role"
  type        = string
  default = null
}

variable "cluster_autoscaler_role" {
  description = "CA name of the IAM role"
  type        = string
  default = null
}

variable "create_eks_cluster" {
  description = "Whether to create EKS cluster"
  type = bool
  default = false
}

variable "instance_profile" {
  type = string
}