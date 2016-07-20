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
