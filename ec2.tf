resource "aws_key_pair" "localstack_instance_key" {
  key_name   = "deployer-key"
  public_key = var.ec2KeyPublic
}

resource "aws_instance" "localstack_instance" {
  ami = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"

  associate_public_ip_address = true
  disable_api_termination = false
  key_name = aws_key_pair.localstack_instance_key.key_name

  depends_on = [ aws_key_pair.localstack_instance_key ]
}