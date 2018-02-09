variable "region" {
  description = "AWS region. Changing it will lead to loss of complete stack."
  default     = "us-east-1"
}

variable "environment" {
  description = "Type of environment: stage/prod depending of this file location"
  default     = "stage"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for public and private subnets"

  default = {
    "public-0"  = "10.0.1.0/24"
    "private-0" = "10.0.2.0/24"
    "public-1"  = "10.0.3.0/24"
    "private-1" = "10.0.4.0/24"
  }
}
