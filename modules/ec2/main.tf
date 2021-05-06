data "aws_ami" "latest-ubuntu" {
most_recent = true
owners = ["099720109477"] # Canonical

  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}


resource "aws_instance" "webserver" {
  ami = data.aws_ami.latest-ubuntu.id
  instance_type = "t1.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = var.sgid
  subnet_id = var.subnetid
}