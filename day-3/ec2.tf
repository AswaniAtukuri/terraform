resource "aws_instance" "name" {
    ami="ami-0c0493bbac867d427"
    key_name = "testing"
    instance_type = "t2.micro"
    subnet_id =aws_subnet.public.id
    security_groups = [ aws_security_group.name.id ]
  
}