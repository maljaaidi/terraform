provider "aws" {}

variable subnet_cidr_block {
  type        = string
  description = "subnet cidr block"
}


resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "development-vpc"
    }
}

resource "aws_subnet" "development-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-1a"
    tags = {
        Name = "development-subnet"
    }
}

data "aws_vpc" "default" {
    default = true
}


output dev-vpc-id {
    value = aws_vpc.development-vpc.id
}

output dev-subnet-id {
    value = aws_subnet.development-subnet-1.id
}

