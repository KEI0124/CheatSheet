terraform {
  backend "s3" {
    bucket  = "terraform-backend-686357878712"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
  }
}
