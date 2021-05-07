output "publicip" {
  value = aws_instance.webserver.public_ip
}

output "sshKey" {
  value = aws_key_pair.SSHkeyforWebserver.public_key
}