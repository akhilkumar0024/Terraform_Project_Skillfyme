output "public_ec2_instance_arn" {
  description = "ARN of the public EC2 instance"
  value       = aws_instance.public-EC2-Instance.arn
}

output "application_address" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.public-EC2-Instance.public_ip
}

output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public-EC2-Instance.id
}
