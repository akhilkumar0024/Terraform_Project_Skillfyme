data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Public EC2 Instance for frontend 
resource "aws_instance" "public-EC2-Instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.public-instance_type
  key_name                    = "ec2-key-pair"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true

  tags = {
    Name          = "${var.public-instance_name}-frontend-${var.environment}"
    Environment   = var.environment
    instance_type = var.public-instance_type
  }

  user_data_replace_on_change = true
  user_data                   = <<-EOF
#!/bin/bash
set -e

# Update and install Docker
apt-get update -y
apt-get install -y docker.io

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Pull and run the frontend React container
docker run -d --name frontend --restart always --add-host backend-service:127.0.0.1 -p 80:80 akhilkumar119/react-frontend:latest

EOF

  lifecycle {
    ignore_changes = [ami]
  }
}

# 2nd EC2 instance 
resource "aws_instance" "public-EC2-Instance-2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.public-instance_type
  key_name                    = "ec2-key-pair"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true

  tags = {
    Name          = "${var.public-instance_name}-nginx-${var.environment}"
    Environment   = var.environment
    instance_type = var.public-instance_type
  }

  user_data_replace_on_change = true
  user_data                   = <<-EOF
#!/bin/bash
set -e

#install nginx
apt-get update -y
apt-get install -y nginx

systemctl start nginx
systemctl restart nginx

#serve a webpage 
echo "<h1>This is the Second EC2 machine</h1>" | sudo tee -a /var/www/html/index.html


EOF

  lifecycle {
    ignore_changes = [ami]
  }
}
