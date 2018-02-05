provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "9ide0n-s3-terraform-state"
    versioning {
        enabled = true
    }
    lifecycle {
        prevent_destroy = true
    }
}

