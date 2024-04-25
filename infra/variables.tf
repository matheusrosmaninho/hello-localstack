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

variable "ec2Ami" {
  type = string
  default = "ami-04e5276ebb8451442"
}

variable "ec2InstanceType" {
  type = string
  default = "t3a.2xlarge"
}