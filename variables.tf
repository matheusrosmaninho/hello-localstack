variable "prefixCidr" {
  type = string
  default = "10.20"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "ec2KeyPublic" {
  type = string
  sensitive = true
}