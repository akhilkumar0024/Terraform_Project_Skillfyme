output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.compute.application_address
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.compute.public_ec2_instance_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.public_subnet_id
}
