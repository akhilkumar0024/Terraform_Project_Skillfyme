variable "environment" {
  type        = string
  description = "The target deployment environment"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "public-instance_type" {
  type        = string
  description = "Instance type for the EC2 machines"
}

variable "public-instance_name" {
  type        = string
  description = "Base name for the EC2 machines"
}
