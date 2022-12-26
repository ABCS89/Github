# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  security_groups = [
    "sg-12345678",
  ]
}
# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "my-s3-bucket"
  acl    = "private"
}

# Allow access to the S3 bucket from the EC2 instance
resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.example.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAccessFromEC2",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "s3:",
      "Resource": "arn:aws:s3:::my-s3-bucket/",
      "Condition": {
        "StringEquals": {
          "aws:sourceVpc": "vpc-12345678"
        }
      }
    }
  ]
}
POLICY
}