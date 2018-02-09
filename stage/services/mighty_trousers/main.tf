provider "aws" {
  region = "${var.region}"
}

# add named keypair for SSH to instance wo password
# we need manually generate key wia ssh-keygen 
resource "aws_key_pair" "mighty_trousers" {
  key_name   = "mighty_trousers"
  public_key = "${file("./id_rsa.pub")}"
}

module "mighty_trousers" {
  source              = "../../../../terraform-applicaton/"
  vpc_id              = "${data.terraform_remote_state.vps.vpc_id}"
  subnets             = ["${data.terraform_remote_state.vps.public-subnet-1-id}", "${data.terraform_remote_state.vps.public-subnet-2-id}"]
  name                = "mighty_trousers"
  environment         = "${var.environment}"
  # ami                 = "ami-41e0b93b"
  enable_ssh          = true
  extra_packages      = "wget"
  external_nameserver = "8.8.8.8"
  keypair             = "${aws_key_pair.mighty_trousers.key_name}"
  instance_count      = 2
}
