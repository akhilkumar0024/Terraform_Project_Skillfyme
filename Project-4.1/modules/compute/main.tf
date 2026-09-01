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
    Name          = var.public-instance_name
    instance_type = var.public-instance_type
  }

  lifecycle {
    ignore_changes = [ami]
  }
}
