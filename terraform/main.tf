provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "yippie-ec2"
  security_groups = ["jenkins"]

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > file.txt"
  }
}

resource "aws_ebs_volume" "example" {
    availability_zone = "${aws_instance.example.availability_zone}"
    size = 40
    tags {
        Name = "HelloWorld"
    }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.example.id}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
  depends_on = ["aws_instance.example"]
}

resource "aws_security_group" "jenkins-ssh" {
  name = "allow_all"
  description = "Allow all traffic for Jenkins CI"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
