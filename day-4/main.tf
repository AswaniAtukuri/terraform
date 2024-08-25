provider "aws" {
    region = "eu-west-2"

}
resource "aws_s3_bucket" "name" {
    bucket = "aswani-123"
  
}
resource "aws_s3_bucket_versioning" "name" {
    bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Enabled"
  }
}
  