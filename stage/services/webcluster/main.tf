provider "aws" {
    region = "eu-central-1"
}

module "webcluster" {
#    source = "git::git@github.com:Mattpopa/tf_mod.git//services/webcluster?ref=v1.0.0"
    source = "../../../../modules/services/webcluster"
    cluster_name = "stage"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
    desired = 2
    enable_autoscaling = false
    app_data_v2 = true
}

