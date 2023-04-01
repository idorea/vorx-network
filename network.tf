resource "aws_vpc" "vorx-vpc-prod"{
  cidr_block  = "10.0.0.0/16"

  tags = {
    Name = "vorx-PRODUCAO"
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

resource "aws_subnet" "vorx-subnet-pub-1b" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id 
  cidr_block = "10.0.2.0/24"
availability_zone  = "us-east-1b"

  tags = {
    Name = "Public-subnet-1b"
  }
}


resource "aws_subnet" "vorx-subnet-priv-1b" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id
  cidr_block = "10.0.20.0/24"
availability_zone  = "us-east-1b"

  tags = {
    Name = "Private-subnet-1b"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "igw-vorx-vpc-prod"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

 
  tags = {
    Name = "vorx-pub-rt"
  }
}

resource "aws_route_table_association" "pub-rt-1a" {
  subnet_id      = aws_subnet.vorx-subnet-pub-1a.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pub-rt-1b" {
  subnet_id      = aws_subnet.vorx-subnet-pub-1b.id
  route_table_id = aws_route_table.public-rt.id
}



resource "aws_route_table" "private-rt-1a" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "vorx-private-rt-1a"
  }
}


resource "aws_route_table" "private-rt-1b" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "vorx-private-rt-1b"
  }
}

resource "aws_route_table_association" "priv-rt-1a-associate" {
  subnet_id      = aws_subnet.vorx-subnet-priv-1a.id
  route_table_id = aws_route_table.private-rt-1a.id
}

resource "aws_route_table_association" "priv-rt-1b-associate" {
  subnet_id      = aws_subnet.vorx-subnet-priv-1b.id
  route_table_id = aws_route_table.private-rt-1b.id
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
