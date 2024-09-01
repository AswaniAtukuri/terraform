provider "aws" {
  region = "eu-west-2"
}
resource "aws_instance" "test" {
    ami = "ami-0c0493bbac867d427"
    instance_type = "t2.micro"
    availability_zone = "eu-west-2a"
    key_name = "testing"
    for_each = toset(var.test)
    
  tags = {
    #Name = "dev-1"
    Name = each.value
    
  }
}

variable "test" {
    type = list(string)
    default = [ "dev","prod"]
  
}