provider "aws" {
    region = "eu-west-2"
     alias = "uk"
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "uk" {
  bucket = "aswani-123"
  provider = aws.uk
}
resource "aws_s3_bucket" "mumbai" {
  bucket = "aswani-1234"
}