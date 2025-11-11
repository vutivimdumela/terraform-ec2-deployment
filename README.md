# Terraform EC2 Deployment Project

This Terraform project deploys an EC2 instance with type `t3.micro` on AWS, including a security group with basic web server configuration.

## Prerequisites

1. **AWS CLI configured** with appropriate credentials
   ```bash
   aws configure
   ```

2. **Terraform installed** (version >= 1.0)
   - Download from [terraform.io](https://www.terraform.io/downloads.html)
   - Or use package manager:
     ```bash
     # macOS
     brew install terraform
     
     # Ubuntu/Debian
     sudo apt-get install terraform
     ```

3. **AWS Key Pair** (optional but recommended for SSH access)
   - Create a key pair in AWS EC2 console or use AWS CLI:
     ```bash
     aws ec2 create-key-pair --key-name my-terraform-key --query 'KeyMaterial' --output text > my-terraform-key.pem
     chmod 400 my-terraform-key.pem
     ```

## Project Structure

```
pipeline-project/
├── main.tf          # Main Terraform configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── README.md        # This file
```

## Configuration

### Variables

You can customize the deployment by setting these variables:

- `aws_region`: AWS region (default: "us-east-1")
- `instance_name`: Name tag for the EC2 instance (default: "terraform-ec2-instance")
- `key_pair_name`: AWS key pair name for SSH access (required if you want SSH access)

### Setting Variables

1. **Create a `terraform.tfvars` file** (recommended):
   ```hcl
   aws_region     = "us-east-1"
   instance_name  = "my-web-server"
   key_pair_name  = "my-terraform-key"
   ```

2. **Or use command line**:
   ```bash
   terraform apply -var="key_pair_name=my-terraform-key"
   ```

3. **Or use environment variables**:
   ```bash
   export TF_VAR_key_pair_name="my-terraform-key"
   ```

## Deployment Steps

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Review the plan**:
   ```bash
   terraform plan
   ```

3. **Apply the configuration**:
   ```bash
   terraform apply
   ```
   Type `yes` when prompted to confirm.

4. **View outputs**:
   ```bash
   terraform output
   ```

## What Gets Created

- **EC2 Instance**: t3.micro instance running Amazon Linux 2
- **Security Group**: Allows SSH (port 22) and HTTP (port 80) access
- **Web Server**: Apache HTTP server with a simple welcome page

## Accessing Your Instance

### Web Browser
After deployment, you can access the web server at the URL provided in the output:
```
http://<public-ip>
```

### SSH Access
If you configured a key pair:
```bash
ssh -i /path/to/your-key.pem ec2-user@<public-ip>
```

## Useful Commands

- **Check status**: `terraform show`
- **List resources**: `terraform state list`
- **View outputs**: `terraform output`
- **Destroy resources**: `terraform destroy`

## Security Considerations

⚠️ **Important**: This configuration opens SSH and HTTP access to the entire internet (0.0.0.0/0). For production use, consider:

1. Restricting SSH access to your IP only:
   ```hcl
   cidr_blocks = ["YOUR_IP/32"]
   ```

2. Using a bastion host or VPN for SSH access
3. Enabling AWS CloudTrail for auditing
4. Using IAM roles instead of access keys

## Cost

The `t3.micro` instance type is eligible for AWS Free Tier (750 hours per month for new accounts).

## Troubleshooting

### Common Issues

1. **No key pair specified**: If you get an error about key_pair_name, either:
   - Set the variable in `terraform.tfvars`
   - Remove the `key_name` parameter from the EC2 resource if SSH access isn't needed

2. **AWS credentials not configured**:
   ```bash
   aws configure list
   ```

3. **Region issues**: Ensure your AWS CLI and Terraform are using the same region

### Clean Up

To avoid ongoing charges, destroy the resources when done:
```bash
terraform destroy
```

## Next Steps

Consider enhancing this project with:
- Load balancers for high availability
- Auto Scaling Groups for scalability
- RDS database for data persistence
- CloudWatch monitoring and alarms
- SSL/TLS certificates for HTTPS