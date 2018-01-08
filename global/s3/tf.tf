terraform {
  backend "s3" {
    bucket  = "digital-tf-state"
    key     = "tf-state-s3"
    region  = "eu-central-1"
    encrypt = true
    profile = "digit-all"
  }
}
