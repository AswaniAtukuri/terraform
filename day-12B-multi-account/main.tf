provider "aws" {
    profile = "default"
     alias = "uk"
}
provider "aws" {
  profile = "aswani"
  alias = "mumbai"
}
resource "aws_s3_bucket" "uk" {
  bucket = "aswani-123"
  
}
resource "aws_s3_bucket" "mumbai" {
  bucket = "aswani-1234"
  provider = aws.mumbai

}