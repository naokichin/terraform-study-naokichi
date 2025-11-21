provider "aws" {
  region = "ap-northeast-1"
}

# ← 最新の Amazon Linux 2023 を常に取得
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# module "network" {
#   source = "../../modules/network"

#   env                 = "dev"
#   vpc_cidr            = "10.0.0.0/16"
#   private_subnet_cidr = "10.0.1.0/24"

#   ami_id        = data.aws_ami.amazon_linux.id
#   instance_type = "t3.micro"
# }

output "dev_ec2_id" {
  value = module.network.ec2_id
}
