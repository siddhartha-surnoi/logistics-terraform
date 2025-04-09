# resource "aws_instance" "bastion" {
#   ami           = var.ami
#   instance_type = var.instance_type
# #    vpc_id  = [var.vpc_id] 
#   subnet_id = slice(var.public_subnet_ids, 0,1)
# #    sg_id = [var.sg_id]
#     security_groups = [slice(var.sg_id, 0,1)]
#   tags = {
#     Name = "bastion-server"
#   }


# }
resource "aws_instance" "bastion" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = element(var.public_subnet_ids, 0)  # Selects the first subnet
  security_groups = [element(var.sg_id, 0)]  # Selects the first security group
   key_name = "sidhu@123"
  tags = {
    Name = "bastion-server"
  }
}
