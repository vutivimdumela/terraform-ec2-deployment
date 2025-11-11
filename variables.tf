variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "terraform-ec2-instance"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair to use for SSH access"
  type        = string
  default     = null
  
  validation {
    condition     = var.key_pair_name != ""
    error_message = "Key pair name cannot be an empty string."
  }
}