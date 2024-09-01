provider "aws" {
  region = "eu-west-2"

}
resource "aws_instance" "test" {
    ami = "ami-0933973bf5587c6b9"
    instance_type = "t2.micro"
    availability_zone = "eu-west-2a"
    key_name = "testing"
    #count=2 
   count = length(var.test) #it will print 3

    
  tags = {
    # Name = "dev-1"
    #Name = "web-${count.index}"
     Name= var.test[count.index]
  }
}
 variable "test" {
    type = list(string)
    default = [ "dev","prod"]
  
}