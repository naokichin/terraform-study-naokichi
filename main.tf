terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # tfstateの保存先
  backend "s3" {
    bucket = "s3-terraform-study-naokichi" # 作成したS3バケット
    region = "ap-northeast-1"
    # バケット内の保存先
    # 適宜変更してください
    key = "envs/dev/terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-1" # 東京リージョン
}

# S3バケットの定義 ↓既に手動で作成済みの為不要
# resource "aws_s3_bucket" "terraform_state" {
#   # バケット名は一意の必要があるので、bucketの値は各自変更してください
#   bucket = "s3-terraform-study-naokichi"
# }

# バージョニング設定
# tfstateファイルを任意の状態に戻せるように有効にしておく
# resource "aws_s3_bucket_versioning" "terraform_state" {
#   bucket = aws_s3_bucket.terraform_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# VPC を作成
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}