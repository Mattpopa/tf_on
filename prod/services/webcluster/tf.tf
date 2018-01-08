terraform {
  backend "s3" {               
    bucket  = "digital-tf-state" 
    key     = "webcluster"   
    region  = "eu-central-1"   
    encrypt = true
    profile = "digit-all"   
  } 
}   

