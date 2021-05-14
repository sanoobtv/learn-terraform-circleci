output "publicIP" {
  value = module.ec2.publicip
}


output "sshKeyname" {
  value = module.ec2.sshKeyname
}

