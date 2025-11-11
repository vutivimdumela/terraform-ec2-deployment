# Backend configuration for storing Terraform state in S3
# This file configures remote state storage in AWS S3

terraform {
  backend "s3" {
  
    bucket = "terraform-state-buekts"
    key = "terraform-ec2-deployment/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    
   
  }
}