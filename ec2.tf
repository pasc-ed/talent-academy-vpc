resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = module.network.my_vpc_id

  # INBOUND RULES
  ingress {
    description = "SSH from my mac"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["31.72.40.251/32"]
  }

  ingress {
    description = "SSH from my VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_app_sg"
  }
}

data "aws_ami" "my_aws_ami" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = [ "amzn2-ami-kernel-*" ]
    }
}

# EC2 - PUBLIC
# resource "aws_instance" "my_public_server" {
#     ami = data.aws_ami.my_aws_ami.id
#     instance_type = var.instance_type
#     key_name = var.keypair_name
#     subnet_id = aws_subnet.public_a.id
#     vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]
# }

# # EC2 - PRIVATE
# resource "aws_instance" "my_first_server" {
#     ami = data.aws_ami.my_aws_ami.id
#     instance_type = var.instance_type
#     key_name = var.keypair_name
#     subnet_id = aws_subnet.private_a.id
#     vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]
# }

# AMI ID
# INSTANCE TYPE
# KEYPAIR
# SUBNET - Private
# SECURITY GROUPS
# USER-DATA template (optional)

# TASK:
# NEW EC2 in Public subnet
# Check the public IP Address exists or add the EIP to the server
# SSH using the keypair to the new public server
# ssh -i ~/.ssh/private_key ec2-user@<IP_PUBLIC_SERVER>
# Try to copy your private key to the public server and connect to the private server.
# scp -i ~/.ssh/ta-lab-key.pem ~/.ssh/ta-lab-key.pem ec2-user@<IP_PUBLIC_SERVER>:/home/users/ec2-user/