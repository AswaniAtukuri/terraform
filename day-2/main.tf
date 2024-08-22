resource "aws_instance" "dev" {
  ami = var.ami
  instance_type = var.type
  key_name = var.key
  
tags={
        Name = "test"
    }  
}
resource "aws_s3_bucket" "prod" {
  bucket = var.bucket
   tags = {
     Name="aswani-1234"
   }
  
}
