resource "aws_vpc" "vorx-vpc-prod"{
  cidr_block  = "10.0.0.0/16"

  tags = {
    Name = "vorx-prod"
  }
}
## OUTPUTS DO NOSSO TF ##
output "vpc-vorx-prod_id" {
value = aws_vpc.vorx-vpc-prod.id
}

output "vpc-vorx-prod-arn" {
value = aws_vpc.vorx-vpc-prod.arn
}

