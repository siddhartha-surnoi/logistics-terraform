# resource "aws_eks_node_group" "backend" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = "eks_node_name"
#   node_role_arn   = aws_iam_role.worker.arn
#   subnet_ids      = var.subnet_private
#   capacity_type = "ON_DEMAND"
#   disk_size = "20"
#   instance_types = ["t2.small"]
#   source_security_group_ids = var.source_security_group_ids
  
#   scaling_config {
#     desired_size = 2
#     max_size     = 10
#     min_size     = 2
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#   # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#   ]
# }