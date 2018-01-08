terraform {
  backend "s3" {
    bucket  = "digital-tf-state"
    key     = "wip-iam"
    region  = "eu-central-1"
    encrypt = true
    profile = "digit-all"
  }
}
