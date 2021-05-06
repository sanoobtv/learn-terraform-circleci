output "subnet_id" {
  value=aws_subnet.this.id
}


output "publicSGid" {
  value = aws_security_group.publicSG.id
}