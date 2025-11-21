terraform {
  backend "s3" {
    bucket = "s3-terraform-study-naokichi"
    key    = "envs/dev/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}
