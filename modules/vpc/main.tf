provider "aws" {
  region = var.region
}
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

}
data "aws_availability_zones" "azs"{
  state = "available"
}
resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  #name="public"
  availability_zone = element(data.aws_availability_zones.azs.names,1 )
  vpc_id = aws_vpc.this.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  cidr_block = "10.0.2.0/24"
  #name="private"
  availability_zone = element(data.aws_availability_zones.azs.names,0 )
  vpc_id = aws_vpc.this.id
}



resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
}

data "aws_route_table" "main_route_table"{
  filter {
    name = "association.main"
    values = [true]
  }
  filter {
    name = "vpc-id"
    values = [aws_vpc.this.id]
  }
}

resource "aws_default_route_table" "internetroute" {
  default_route_table_id = data.aws_route_table.main_route_table.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name="IGW TF"
    name="IGW TF"
  }
}

resource "aws_security_group" "publicSG" {
  name = "publicSG"
  vpc_id = aws_vpc.this.id
  description = "allow http and ssh"
  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port = ingress.value["port"]
      to_port = ingress.value["port"]
      protocol = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_Blocks"]
      description = ingress.value["description"]
    }
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name="PublicSecurityGroup TF"
  }
}