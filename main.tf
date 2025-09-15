terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1" # 東京リージョン
}

# VPC を作成
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }
