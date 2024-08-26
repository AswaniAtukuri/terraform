terraform {
  backend "s3" {
    bucket = "aswani-1234"
    key    = "ashu/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run "day-7A-resources-s3-dynamodb-for-statefile" to create s3 and dynamodb resources
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
  }
}