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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAl3KRXI1MYxoUdOck14jPjxby4GcIqFS8IEYFRFcJLs+WDs3x1wCioKj3P88sRjm3k8p9M2xk7ZHXsPgN0zFnoMncCbY1kieFduqj70tZnR4d4/gnBB2E2zpZae+d1Vle999EEsu0d3t8PZRaEHborwK4q+ZiUxf+JXifwuLeExuQQqdcANrHIJe5EgX4ru7VDCXa+E7LJ9+S5XGD93no5af4AkPf77s/oQJWogdeUZjXLxlNn25zVJyCUCvallQZ/BDacftqui/hfVNkAMoNufZYODGeDYP0bFqNKjRVUz1ymGGz/478dHaaNMwSoP2y2xZCsjbImbYNsiqRPc/hVQ== rsa-key-20210514"
  key_name = var.keyname
}

resource "aws_instance" "webserver" {
  ami = data.aws_ami.latest-ubuntu.id

  instance_type = "t1.micro"
  associate_public_ip_address = true
  subnet_id = var.subnetid
  security_groups = [var.sgid]
  key_name = aws_key_pair.SSHkeyforWebserver.key_name
  provisioner "file" {
  source      = "script.sh"
  destination = "/tmp/script.sh"
  }

}