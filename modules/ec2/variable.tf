variable "sgid" {
  description = "the public SG ID from the VPC module"
  type = list(string)

}

variable "subnetid" {

  type=string
  description = "subnet id passed to the ec2 instance"
}