output "current_workspace" {
  description = "The active Terraform workspace"
  value       = terraform.workspace
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.public_subnet_id
}

output "ec2_public_ip_1" {
  description = "Public IP address of the frontend EC2 instance"
  value       = module.compute.application_address
}

output "ec2_public_ip_2" {
  description = "Public IP address of the 2nd EC2 instance"
  value       = module.compute.public-ip-2
}

output "ec2_instance_id" {
  description = "ID of the frontend EC2 instance"
  value       = module.compute.public_ec2_instance_id
}
