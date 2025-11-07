variable "aws_region" {
  description = "AWS region to deploy infrastructure"
  type = string
  default = "us-east-1"
}
variable "instance_type" {
  description = "Instance type for EC2"
  type = string
  default = "t2.micro"
}
