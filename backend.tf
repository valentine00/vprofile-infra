terraform {
  backend "s3" {
    bucket = "vprofileactions266"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}