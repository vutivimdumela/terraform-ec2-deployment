# Example Terraform variables file
# Copy this to terraform.tfvars and modify as needed

# AWS Region where resources will be created
aws_region = "us-east-1"

# Name tag for the EC2 instance
instance_name = "my-terraform-ec2"

# AWS Key Pair name for SSH access (create this in AWS console first)
# If you don't need SSH access, you can comment this out
key_pair_name = "my-terraform-key"

##