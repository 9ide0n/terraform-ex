variable "region" {
  description = "AWS region. Changing it will lead to loss of complete stack."
  default     = "us-east-1"
}

variable "environment" {
  description = "Type of environment: stage/prod depending of this file location"
  default     = "stage"
}
