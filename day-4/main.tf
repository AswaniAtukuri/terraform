provider "aws" {
    region = "eu-west-2"

}
resource "aws_s3_bucket" "name" {
    bucket = "aswani-123"
  
}
  