variable "region" {
  type        = string
  default     = "us-east-2"
  description = "The AWS region to deploy infrastructure into"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of EC2 instance that will be deployed"
}
