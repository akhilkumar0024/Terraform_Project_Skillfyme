output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public-subnet.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.vpc-main-sg.id
}
