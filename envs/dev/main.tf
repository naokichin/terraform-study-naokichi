provider "aws" {
  region = "ap-northeast-1"
}

module "network" {
  source = "../../modules/network"

  env                 = "dev"
  vpc_cidr            = "10.0.0.0/16"
  private_subnet_cidr = "10.0.1.0/24"

  ami_id = "ami-060e6df00d4e4c5c2"  # ← 東京リージョン用AMIを指定（後で教える）
  instance_type = "t3.micro"
}

output "dev_ec2_id" {
  value = module.network.ec2_id
}
