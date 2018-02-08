variable "region" {
  description = "AWS region. Changing it will lead to loss of complete stack."
  default     = "us-east-1"
}

variable "environment" {
  description = "Type of environment: stage/prod depending of this file location"
  default     = "stage"
}

variable "vps_remote_state_bucket" {
  description = "The name of the S3 bucket for the VPS remote state"
  default     = "9ide0n-s3-terraform-state"
}

variable "vps_remote_state_key" {
  description = "The path for the VPS remote state in S3"
  default     = "stage/vps/terraform.tfstate"
}
