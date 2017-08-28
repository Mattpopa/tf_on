provider "aws" {
    region = "eu-central-1"
}

module "webcluster" {
    source = "git::git@github.com:Mattpopa/tf_mod.git//services/webcluster?ref=v1.0.0"
        cluster_name = "prod"
        instance_type = "t2.micro"
        min_size = 2
        max_size = 4
}

resource "aws_autoscaling_schedule" "scale_out" {
    scheduled_action_name = "scale-out-during-business-hours"
        min_size              = 2
        max_size              = 10
        desired_capacity      = 3
        recurrence            = "0 9 * * *"
        autoscaling_group_name = "${module.webcluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in" {
    scheduled_action_name = "scale-in-at-night"
        min_size              = 2
        max_size              = 10
        desired_capacity      = 2
        recurrence            = "0 17 * * *"
        autoscaling_group_name = "${module.webcluster.asg_name}"
}
