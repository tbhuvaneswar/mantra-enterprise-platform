variable "cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "name" {
  description = "VPC name"
  type        = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}
