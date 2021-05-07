output "publicIP" {
  value = module.ec2.publicip
}

output "sshKey" {
  value = module.ec2.sshKey
}

output "sshKeyname" {
  value = module.ec2.sshKeyname
}

