# resource "aws_iam_role" "master" {
#   name = "master"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       }
#     ]
#   })
# }



# resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
#   role       = aws_iam_role.master_eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
#   role       = aws_iam_role.master_eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
#   role       = aws_iam_role.master_eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
# }

