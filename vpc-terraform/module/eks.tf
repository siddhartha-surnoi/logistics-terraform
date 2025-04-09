

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"


#   cluster_name    = "logstics-cluster"
#   cluster_version = "1.31"

#   cluster_endpoint_public_access  = true

#   cluster_addons = {
#     coredns                = {}
#     eks-pod-identity-agent = {}
#     kube-proxy             = {}
#     vpc-cni                = {}
#   }

#   vpc_id                   = module.logstic_vpc.vpc_id
#   subnet_ids               = slice(module.logstic_vpc.subnet_private, 0, 2)
#   control_plane_subnet_ids = slice(module.logstic_vpc.subnet_private, 0, 2)

#   create_cluster_security_group = false
#   cluster_security_group_id     = module.security_group.sg_id[0]

#   create_node_security_group = false
#   node_security_group_id     = module.security_group.sg_id[0]

#   # the user which you used to create cluster will get admin access

#   # EKS Managed Node Group(s)
#   eks_managed_node_group_defaults = {
#     instance_types = ["t3a.medium"]
#     disk_size             = 10
#   }

#   eks_managed_node_groups = {
  
#     logstic_nodes = {
    
#       ami_type       = "AL2023_x86_64_STANDARD"
#       instance_types = ["t3a.medium"]
#       capacity_type = "SPOT"
#        disk_size             = 10
#       min_size     = 2
#       max_size     = 10
#       desired_size = 2
#       iam_role_additional_policies = {
#         AmazonEBSCSIDriverPolicy          = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
#         AmazonElasticFileSystemFullAccess = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
#         ElasticLoadBalancingFullAccess = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
#       }
#       # EKS takes AWS Linux 2 as it's OS to the nodes
#     #   key_name = "sidhu@123"
#     }
#   }

#   # Cluster access entry
#   # To add the current caller identity as an administrator
#   enable_cluster_creator_admin_permissions = true
#   create_cloudwatch_log_group = false

#  tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.31"

  bootstrap_self_managed_addons = false
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = "vpc-1234556abcdef"
  subnet_ids               = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
  control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}