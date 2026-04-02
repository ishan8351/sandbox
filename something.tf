# main.tf
provider "aws" {
  region = "us-east-1"
}

# VULNERABLE BUCKET: Missing compliance policies
resource "aws_s3_bucket" "my_bucket" {
  bucket = "regradar-patient-data-bucket"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
