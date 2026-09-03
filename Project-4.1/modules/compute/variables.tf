variable "public-instance_type" {
  type        = string
  description = "The type of instance to launch"
  default     = "t3.small"
}

variable "public-instance_name" {
  type        = string
  description = "Name of the instance"
  default     = "App-Server"
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to launch the instance into"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs to associate with the instance"
  default     = []
}

variable "environment" {
  type        = string
  description = "Environment name (e.g. dev, staging, prod)"
}

