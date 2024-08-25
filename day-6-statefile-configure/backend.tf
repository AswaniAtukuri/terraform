terraform {
  backend "s3" {
    bucket = "aswani-123"
    key = "ashu/terraform.tfstate"
    region = "eu-west-2"
    
  }
}