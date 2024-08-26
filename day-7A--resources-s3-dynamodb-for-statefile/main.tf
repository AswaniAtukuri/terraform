provider "aws" {
  region = "eu-west-2"
  
}
#-------store the statefile ------#
resource "aws_s3_bucket" "test" {
  bucket = "aswani-1234"
  
  
}
#-------Locking provision for statefile -------------------#
resource "aws_dynamodb_table" "state-lock" {
     name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
  
}