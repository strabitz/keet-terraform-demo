data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0ac6967966621d983"]
  }

  # Only use AMI published by CentOS
  owners = ["125523088429"]
}

resource "aws_instance" "instance" {
  ami                     = data.aws_ami.centos.id
  instance_type           = var.instance_type

  tags = {
    Name  = "instance"
  }
}
