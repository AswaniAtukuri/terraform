
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0c0493bbac867d427"
  instance_type          = "t2.micro"
  key_name               = "testing"
  monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-0fe9b489e712638da"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
}
