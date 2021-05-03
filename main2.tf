variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

module "vpc" {
  source = "modules/vpc"
  region = var.main_region
}

resource "aws_instance" "myinstance" {
  ami = module.vpc.ami_id
  instance_type = "t3.micro"
  subnet_id =module.vpc.subnet_id
}