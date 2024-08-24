resource "aws_instance" "name" {
    ami="ami-0c0493bbac867d427"
    key_name = "testing"
    instance_type = "t2.micro"
    subnet_id =aws_subnet.public.id
    security_groups = [ aws_security_group.name.id ]
    associate_public_ip_address = true
  
}
#private ec2
resource "aws_instance" "private" {
    ami="ami-0933973bf5587c6b9"
    key_name = "testing"
    instance_type = "t2.micro"
    subnet_id =aws_subnet.private.id
    security_groups = [ aws_security_group.name.id ]
}


