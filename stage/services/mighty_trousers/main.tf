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
  source              = "../../../../terraform-modules/services/application"
  vpc_id              = "${data.terraform_remote_state.vps.vpc_id}"
  subnet_id           = "${data.terraform_remote_state.vps.vpc_public_subnet_id}"
  name                = "mighty_trousers"
  environment         = "${var.environment}"
  ami                 = "ami-41e0b93b"
  enable_ssh          = true
  extra_packages      = "wget"
  external_nameserver = "8.8.8.8"
  keypair             = "${aws_key_pair.mighty_trousers.key_name}"
}

