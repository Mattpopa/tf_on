provider "aws" {
    region = "eu-central-1"
}

module "webcluster" {
    source = "git::git@github.com:Mattpopa/tf_mod.git//services/webcluster?ref=v1.0.0"
    cluster_name = "prod"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 4
    enable_autoscaling = true
}
