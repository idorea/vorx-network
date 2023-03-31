resource "aws_vpc" "vorx-vpc-prod"{
  cidr_block  = "10.0.0.0/16"

  tags = {
    Name = "vorx-prod"
  }
}

resource "aws_subnet" "vorx-subnet-pub-1a" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id
  cidr_block = "10.0.1.0/24"
availability_zone  = "us-east-1a"

  tags = {
    Name = "Public-subnet-1a"
  }
}


resource "aws_subnet" "vorx-subnet-priv-1a" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id
  cidr_block = "10.0.10.0/24" 
availability_zone  = "us-east-1a"

  tags = {
    Name = "Private-subnet-1a"
  }
}


## OUTPUTS DO NOSSO TF ##
output "vpc-vorx-prod_id" {
value = aws_vpc.vorx-vpc-prod.id
}

output "vpc-vorx-prod-arn" {
value = aws_vpc.vorx-vpc-prod.arn
}

output "vorx_prod_subnets" {
value = "aws_subnet.*.id"
}
