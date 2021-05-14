output "publicip" {
  value = aws_instance.webserver.public_ip
}



output "sshKeyname" {
  value = aws_key_pair.SSHkeyforWebserver.key_name
  sensitive = false
}