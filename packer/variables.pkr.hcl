variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "base_ami_name" {
  type    = string
  default = "amazon-eks-node-1.29-*"
}

variable "image_version" {
  type    = string
  default = "1.0"
}
