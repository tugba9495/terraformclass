resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "my-key-name"
  tags = {
    Name = "terraform-instance"
  }
  
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow inbound traffic"
  tags = {
      Name = "terraform-sg"
  } 
}

resource "aws_security_group_rule" "ingress" {
  for_each          = var.sg_ingress_rules
  type              = each.value.type
  protocol          = each.value.protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_blocks       = [each.value.cidr_block]
  security_group_id = aws_security_group.sg.id
}