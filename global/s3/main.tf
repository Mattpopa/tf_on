provider "aws" {
    region = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "digital-tf-state"
    versioning {
        enabled = true
    }
    lifecycle {
        prevent_destroy = true
    }
}

