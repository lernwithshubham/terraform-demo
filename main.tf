resource "aws_instance" "example" {
  ami = "ami-0c5ddb3560e768732" 
  instance_type = var.instance_type
  tags = {
    Name = "ExampleInstance"
  }
}
