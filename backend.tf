

terraform {
  backend "s3" {
   
    bucket = "terraform-state-buekts"
    key = "terraform-ec2-deployment/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
    
    
  }
}