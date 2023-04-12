resource "aws_iam_user" "sesuser" {
  name = "sesuser"
}

resource "aws_iam_access_key" "ses_access_key" {
  user = aws_iam_user.sesuser.name
}

resource "aws_ssm_parameter" "ses_access_key" {
  name  = "/accesskey/ses/smtp/password"
  type  = "SecureString"
  overwrite = true
  value = aws_iam_access_key.ses_access_key.ses_smtp_password_v4
}

