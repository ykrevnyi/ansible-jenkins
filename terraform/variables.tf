variable "access_key" {
  type = "string"
  description = "AWS Access Key"
}

variable "secret_key" {
  type = "string"
  description = "AWS Secret Key"
}

variable "region" {
  type = "string"
  description = "AWS Default Region"
  default = "us-west-2"
}

variable "amis" {
  type = "map"
  description = "AWS List of AMIs"
  default = {
    us-west-1a = "-"
    us-west-2 = "ami-d732f0b7"
  }
}
