variable "region" {
  type=string
  default = "us-east-1"
}

variable "rules" {
  type = list(object({
    port=number
    protocol=string
    cidr_Blocks=list(string)
    description=string
  }))
  default = [
    {
    port=22
    protocol="TCP"
    cidr_Blocks=["0.0.0.0/0"]
    description="AlloSSH"
   },
   {
    port=80
    protocol="TCP"
    cidr_Blocks=["0.0.0.0/0"]
     description="AlloHttp"
    },
    {
    port=443
    protocol="TCP"
    cidr_Blocks=["0.0.0.0/0"]
    description="AlloHttps"
    }
  ]
}