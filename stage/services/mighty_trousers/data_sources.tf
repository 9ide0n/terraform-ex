# connect to s3 backend and get state from vps tfstate file to db datasource to later use in variables
data "terraform_remote_state" "vps" {
  backend = "s3"

  config {
    bucket = "${var.vps_remote_state_bucket}"
    key    = "${var.vps_remote_state_key}"
    region = "us-east-1"
  }
}
