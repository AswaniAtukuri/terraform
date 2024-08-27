provider "aws" {
    region = "eu-west-2"
  
}
#vpc using data resource

data "aws_vpc" "vpc" {
    filter {
      name = "tag:Name"
      values = ["testing"]
    }
  
}
#subnet using data resource
  data "aws_subnets" "private" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
   }
  }
#security group using data resource
  data "aws_security_group" "name" {
  id = "sg-0301ddec2a2c0f831"
    
  }

#target group
 resource "aws_lb_target_group" "alb" {
  name        = var.name
  target_type = var.target_type
  port        = var.port
  protocol    = var.protocol
  vpc_id      = data.aws_vpc.vpc.id
}

#load blancer
 resource "aws_lb" "test" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.private.ids

  enable_deletion_protection = false
  
depends_on = [ aws_lb_target_group.alb ]

}