provider "aws" {
  region = "ap-northeast-1"
}

module "network" {
  source = "../../modules/network"

  env                 = "prod"
  vpc_cidr            = "10.1.0.0/16"
  private_subnet_cidr = "10.1.1.0/24"

  ami_id = "ami-0f36dcfc7ca70a913"  # 同じで可
  instance_type = "t3.micro"
}

output "prod_ec2_id" {
  value = module.network.ec2_id
}
