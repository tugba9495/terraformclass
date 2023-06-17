resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-instance"
  }
}