provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    # source = "../../../../terraform-modules/services/webserver-cluster"
    source = "git::git@github.com:9ide0n/terraform-modules.git//services/webserver-cluster?ref=enable_new_user_data"
    cluster_name = "webservers-prod"
    db_remote_state_bucket = "9ide0n-s3-terraform-state"
    db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
    instance_type = "t2.micro"
    min_size = 2
    max_size = 10
    enable_autoscaling=true
    enable_new_user_data = true
}

