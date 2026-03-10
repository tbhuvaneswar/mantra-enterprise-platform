variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "mantra-dev-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnets" {
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "availability_zones" {
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "developer_ip" {

  default = "49.207.57.49/32"


}
