output "eip" {
    value = "${aws_instance.pebble-app-server-blue-qa.public_ip}"
}