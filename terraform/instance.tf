resource "aws_instance" "example" {
  ami             = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  key_name        = "yippie-ec2"
  security_groups = ["jenkins"]
}
