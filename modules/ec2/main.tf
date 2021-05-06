data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}



resource "aws_instance" "webserver" {
  ami = data.aws_ssm_parameter.ami.id
  instance_type = "t1.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = var.sgid
  subnet_id = ""
}