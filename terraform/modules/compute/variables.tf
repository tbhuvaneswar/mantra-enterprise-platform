variable "ami_id" {
  description = "Golden AMI created by Packer"
  type        = string
}

variable "instance_type" {
  default = "c7i-flex.large"
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "environment" {
  type = string
}

variable "target_group_arn" {
  type = string
 
} 

variable "instance_profile_name" {
  type = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}
