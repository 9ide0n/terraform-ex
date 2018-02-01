provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-41e0b93b"
    instance_type = "t2.micro"
}
