data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0ac6967966621d983"]
  }

  # Only use AMI published by CentOS
  owners = ["125523088429"]
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.tpl")

  vars = {
    region = var.region
  }
}

resource "aws_instance" "instance" {
  ami                     = data.aws_ami.centos.id
  instance_type           = var.instance_type

  tags = {
    Name  = "instance"
  }

  user_data = data.template_file.user_data.rendered
}
