variable "aws_region" {
  description = "AWS region to deploy infrastructure"
  type = string
  default = "us-east-2"
}
variable "instance_type" {
  description = "Instance type for EC2"
  type = string
  default = "t2.micro"
}

variable "ami_id" {
  description = "Amazon machine Image for EC2"
  type = string
  default = "ami-0c5ddb3560e768732"
}
