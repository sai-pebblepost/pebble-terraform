resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "pebble-s3-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_instance_profile" "s3_access" {
name  = "test_profile"                         
roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
}

resource "aws_iam_policy" "s3-config" {
  name        = "pebble-s3-config"
  description = "s3-role-policy"
  policy      = "${file("policy.json")}"
}

resource "aws_iam_policy_attachment" "s3-copy" {
  name       = "s3-copy-config"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.s3-config.arn}"
}

resource "aws_iam_instance_profile" "s3-copy" {
  name  = "s3_copy_config"
  roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
}


