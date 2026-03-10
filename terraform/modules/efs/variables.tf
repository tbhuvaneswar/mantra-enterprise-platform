variable "name" {
  description = "EFS name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for EFS mount targets"
  type        = list(string)
}
