resource "aws_instance" "terraform-instance" {
  ami           = data.aws_ami.amazon_linux2.image_id
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.terraform-instance-profile
  depends_on = [
    aws_iam_role_policy.assume_role,
  ]
}