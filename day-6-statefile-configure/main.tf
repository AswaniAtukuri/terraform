resource "aws_instance" "name" {
    ami="ami-0933973bf5587c6b9"
    key_name = "testing"
    instance_type = "t2.micro"
    availability_zone = "eu-west-2a"
    tags = {
        name="backedtest"
    }
  
}
resource "aws_s3_bucket" "name" {
    bucket = "praveen-1428"
  
}