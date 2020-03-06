resource "aws_eip" "pebble-app-server-blue-qa" {
  instance = "${aws_instance.pebble-app-server-blue-qa.id}"
  vpc      = true
}