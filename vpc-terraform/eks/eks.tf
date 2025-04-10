# resource "aws_eks_cluster" "eks" {
#   name = var.cluster_name


#   role_arn = aws_iam_role.master.arn
#   version  = var.version

#   vpc_config {
#     endpoint_private_access = true
#     endpoint_public_access  = false

#     subnet_ids = [
#      slice(var.subnet_private, 0,2)
#     ]
#   }

#   # Ensure that IAM Role permissions are created before and deleted
#   # after EKS Cluster handling. Otherwise, EKS will not be able to
#   # properly delete EKS managed EC2 infrastructure such as Security Groups.
#   depends_on = [
#    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
#    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
#    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
#    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.AmazonS3FullAccess,
#    aws_iam_role_policy_attachment.AmazonSSMManagedInstanceCore,
#    aws_iam_role_policy_attachment.AWSXrayFullAccess,
#    aws_iam_role_policy_attachment.cluster_AmazonEKSLocalOutpostClusterPolicy
#   ]

# }



