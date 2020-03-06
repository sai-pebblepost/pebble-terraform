resource "aws_instance" "pebble-app-server-blue-qa" {
    lifecycle {
        ignore_changes = ["ami"]
    }
  ami = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  key_name = "pebble"
  security_groups = ["${aws_security_group.pebble-app-server-sg-blue.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.s3-copy.name}"
  user_data = "${file("userdata.txt")}"
  tags = {
     Name = "pebble-app-server-blue-qa"
     owner = "sai"
     environment = "POC"
     }
}