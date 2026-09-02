output "public_ec2_instance_arn" {
  description = "ARN of the public EC2 instance"
  value       = aws_instance.public-EC2-Instance.arn
}

output "application_address" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.public-EC2-Instance.public_ip
}

output "public-ip-2" {
  description = "Public IP of the 2nd EC2 machine"
  value       = aws_instance.public-EC2-Instance-2.public_ip
}

output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public-EC2-Instance.id
}
