provider "aws" {
  region = var.region
}
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "this" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.this.id
}
data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}