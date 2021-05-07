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
resource "tls_private_key" "privateKey" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "SSHkeyforWebserver" {
  public_key = tls_private_key.privateKey
  key_name = var.keyname
}

resource "aws_instance" "webserver" {
  ami = data.aws_ami.latest-ubuntu.id
  instance_type = "t1.micro"
  associate_public_ip_address = true
  subnet_id = var.subnetid
  security_groups = [var.sgid]
  key_name = aws_key_pair.SSHkeyforWebserver.key_name
}