# VPC configuration vars
region   = "us-east-1"
vpc_name = "Test_VPC"
vpc_tags = {
  Name        = "Test_VPC"
  Environment = "Test"
}
vpc_address            = "10.32.0.0/16"
public_subnet_address  = ["10.32.0.0/20", "10.32.16.0/20", "10.32.32.0/20"]
public_subnet_zone     = ["us-east-1a", "us-east-1b", "us-east-1c"]
cluster_subnet_address = ["10.32.48.0/20", "10.32.64.0/20", "10.32.80.0/20"]
cluster_subnet_zone    = ["us-east-1a", "us-east-1b", "us-east-1c"]

# ECR repo configuration vars
repo_names = ["movie-analyst-api", "movie-analyst-ui"]

# EC2 instances configuration vars
key_name      = "rampup_miguel"
instance_type = "t2.micro"
aws_key_pair  = "/home/devops/Documents/aws_training_keys/rampup_miguel.pem"

# Backend terraform
bucket_name = "backend-tf-ramup-mai"
acl         = "private"
tags = {
  Environment = "Test",
  CreateBy    = "terraform"
}

