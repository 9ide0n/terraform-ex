provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "git::git@github.com:9ide0n/terraform-modules.git//services/webserver-cluster?ref=v0.0.2"
    cluster_name = "webservers-stage"
    db_remote_state_bucket = "9ide0n-s3-terraform-state"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 2
}
# add open port to security group defined in module for testing
resource "aws_security_group_rule" "allow_testing_inbound" {
    type = "ingress"
    security_group_id = "${module.webserver_cluster.elb_security_group_id}"
    from_port = 12345
    to_port = 12345
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}