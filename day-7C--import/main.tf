resource "aws_instance" "name" {
  ami = "ami-0c0493bbac867d427"
  key_name = "testing"
  instance_type = "t2.micro"
  tags = {
    Name="ec2"
  }
}
#command terraform import aws_instance.name i-0d0aeda124c54443c