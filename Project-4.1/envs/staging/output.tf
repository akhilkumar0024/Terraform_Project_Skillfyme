output "vpc_id" {
  description = "VPC ID of the staging environment"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "Public Subnet ID of the staging environment"
  value       = module.networking.public_subnet_id
}

output "frontend_public_ip" {
  description = "Public IP address of the frontend EC2 instance"
  value       = module.compute.application_address
}

output "nginx_public_ip" {
  description = "Public IP address of the Nginx EC2 instance"
  value       = module.compute.public-ip-2
}

output "frontend_instance_id" {
  description = "Instance ID of the frontend instance"
  value       = module.compute.public_ec2_instance_id
}
