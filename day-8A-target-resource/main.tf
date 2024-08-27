resource "aws_instance" "name" {
    ami = "ami-0933973bf5587c6b9"
    instance_type = "t2.micro"
    key_name = "testing"
}

resource "aws_s3_bucket" "name" {
    bucket = "aswani-123" 
}

#terraform apply -target=aws_s3_bucket.name  (or)apply -target=aws_instance.name 
#terraform destroy -target=aws_s3_bucket.name