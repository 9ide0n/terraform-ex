provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "git::git@github.com:9ide0n/terraform-modules.git//services/webserver-cluster?ref=v0.1.0"
    cluster_name = "webservers-prod"
    db_remote_state_bucket = "9ide0n-s3-terraform-state"
    db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 10
    enable_autoscaling=true
}

