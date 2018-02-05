terraform {
  backend "s3" {
    bucket         = "9ide0n-s3-terraform-state"
    key            = "global/dynamodb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-lock-table-for-terraform-state-cowork"
    encrypt        = true 
  }
}