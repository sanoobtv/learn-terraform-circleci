variable "sgid" {
  description = "the public SG ID from the VPC module"
  type = string

}

variable "subnetid" {

  type=string
  description = "subnet id passed to the ec2 instance"
}