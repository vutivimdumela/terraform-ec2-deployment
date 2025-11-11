# Backend configuration for storing Terraform state in S3
# This file configures remote state storage in AWS S3

terraform {
  backend "s3" {
    # S3 bucket name where the state file will be stored
    bucket = "terraform-state-buekts"
    
    # Path within the bucket where the state file will be stored
    key = "terraform-ec2-deployment/terraform.tfstate"
    
    # AWS region where the S3 bucket is located
    region = "us-east-1"
    
    # Enable server-side encryption for the state file
    encrypt = true
    
    # Optional: DynamoDB table for state locking to prevent concurrent modifications
    # Uncomment the line below if you have a DynamoDB table for state locking
    # dynamodb_table = "terraform-state-lock"
    
    # Optional: Server-side encryption configuration
    # kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012"
  }
}