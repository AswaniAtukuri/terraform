#----------------------- custom network creation#--------------------
#vpc creation
resource "aws_vpc" "cust" {
    cidr_block = "10.1.0.0/16"
    tags ={
      name = "praveen"
    }
  
}
#create internet gateway and attach to vpc
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.cust.id
    tags = {
      name = "cust_ig"
    }
  
}
#create subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.1.0.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      name = "cust_public_sub1"
    }
  
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.1.1.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      name = "cust_private_sub2"
    }
  
}
#create route table and attach to ig(edit routes)
resource "aws_route_table" "publicroute" {
    vpc_id = aws_vpc.cust.id

    route {
        gateway_id = aws_internet_gateway.igw.id
        cidr_block = "0.0.0.0/0"
    }
  
}

#subnet association add subnets into RT
resource "aws_route_table_association" "custpub" {
    route_table_id = aws_route_table.publicroute.id
    subnet_id = aws_subnet.public.id
  
}
#create security groups
resource "aws_security_group" "name" {
  name = "allow_tls"
  vpc_id = aws_vpc.cust.id
  tags = {
    name = "ter-sg"
  }
  ingress {
    description ="tls from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description ="tls from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#allocate eip
 
resource "aws_eip" "name" {
  
}
#NAT GateWay creation

resource "aws_nat_gateway" "public" {
  subnet_id = aws_subnet.public.id
  allocation_id = aws_eip.name.id
  tags = {
    name = "nat"
  }
  
} 
#create private route table and attach to natgateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.cust.id
  route {
    nat_gateway_id = aws_nat_gateway.public.id
    cidr_block = "0.0.0.0/0"
  }
  
}
#private subnet association add subnet into private rt
resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  subnet_id = aws_subnet.private.id
  
}








