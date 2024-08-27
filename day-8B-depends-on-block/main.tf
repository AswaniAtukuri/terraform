resource "aws_instance" "name" {
    ami = "ami-0933973bf5587c6b9"
    instance_type = "t2.micro"
    key_name = "testing"
    depends_on = [ aws_s3_bucket.name ]
}

resource "aws_s3_bucket" "name" {
    bucket = "aswani-123" 
    
}