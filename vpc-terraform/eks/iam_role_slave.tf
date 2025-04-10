# resource "aws_iam_role" "worker" {
#   name = "worker"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action    = "sts:AssumeRole"
#         Effect    = "Allow"
#         Sid       = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
# }

# resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
# }

# resource "aws_iam_role_policy_attachment" "AWSXrayFullAccess" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AWSXrayFullAccess"
# }

# resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
# }

# resource "aws_iam_role_policy_attachment" "AmazonS3FullAccess" {
#   role       = aws_iam_role.worker.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
# }

# resource "aws_iam_instance_profile" "worker" {
#   name = "worker-eks"
#   role = aws_iam_role.worker.name
# }
