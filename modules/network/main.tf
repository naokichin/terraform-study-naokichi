###################################
# VPC
###################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-vpc"
  }
}

###################################
# Private Subnet
###################################
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "${var.env}-private-subnet"
  }
}

###################################
# Security Group
###################################
resource "aws_security_group" "instance_sg" {
  name        = "${var.env}-instance-sg"
  description = "Security group for EC2"
  vpc_id      = aws_vpc.this.id

  # Inbound: No direct access（必要なら後でBastionなど追加）
  ingress = []

  # Outbound: Allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-instance-sg"
  }
}

###################################
# EC2 Instance (private subnet)
###################################
resource "aws_instance" "private_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false   # private subnet!

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "${var.env}-private-ec2"
  }
}
