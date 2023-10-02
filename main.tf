data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = var.instance_ami
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_eip" "eip" {
  count    = var.attach_elastic_ip ? 1 : 0
  instance = aws_instance.EC2.id
  domain   = "vpc"
}

resource "aws_instance" "EC2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = file("./scripts/user_data.tmpl")
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  lifecycle {
    ignore_changes = [
      ami
    ]
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = var.vol_size
  }
  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = "Security group for pritunl"
  vpc_id      = var.vpc_id
  ingress = [{
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    description      = "Pritunl HTTPS"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      description      = "Pritunl HTTP"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      from_port        = var.vpn_udp_port
      to_port          = var.vpn_udp_port
      protocol         = "udp"
      description      = "UDP port number for Pritunl server"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      description      = "SSH Access"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress = [{
    description      = "Outbound rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    }
  ]

}
