provider "aws" {
    region = "eu-central-1"
}

module "webcluster" {
    source = "git::git@github.com:Mattpopa/tf_mod.git//services/webcluster?ref=v1.0.0"
    cluster_name = "stage"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
}

resource "aws_security_group_rule" "allow_tmp_testing" {
    type = "ingress"
    security_group_id = "${module.webcluster.elb_security_group_id}"
        from_port = 99999
        to_port = 99999
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

