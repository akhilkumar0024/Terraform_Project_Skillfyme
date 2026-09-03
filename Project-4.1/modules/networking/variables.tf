
variable "environment" {
  type        = string
  description = "Environment name (e.g. dev, staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}
