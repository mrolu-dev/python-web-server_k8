# Get a list of availability zones in the specified region
data "aws_availability_zones" "available" {
  state = "available"
}

# Get the latest Amazon Linux 2 AMI for the specified region
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

# Get the current region
data "aws_region" "current" {}

# Fetch the default VPC (if needed for reference)
data "aws_vpc" "default" {
  default = true
}

# Fetch the default security group of the VPC
data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Fetch the ID of an S3 bucket (useful for existing buckets)
data "aws_s3_bucket" "existing_bucket" {
  bucket = "mrolu-bucket"  # Replace with your bucket name
}
