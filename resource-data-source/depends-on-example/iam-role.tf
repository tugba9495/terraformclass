resource "aws_iam_role" "terraform-role" {
  description = "this role is for terraform server"
  name = "terraform-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
    tags = {
    Name = "terraform-role"
  }
}

resource "aws_iam_instance_profile" "terraform-instance-profile" {
  name = "terraform-instance-profile"
  role = aws_iam_role.terraform-role.name
}

resource "aws_iam_policy" "terraform-policy" {
  name        = "terraform-policy"
  path        = "/"
  description = "My terraform-policy"
  policy = templatefile("policy/terraform.json")
  tags = {
    Name = "terraform-policy"
  }
}

resource "aws_iam_policy_attachment" "terraform-policy-attachment" {
  role       = aws_iam_role.terraform-role.name
  policy_arn = aws_iam_policy.terraform-policy.arn
}