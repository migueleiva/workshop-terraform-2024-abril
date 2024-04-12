import {
  to = aws_instance.ec2_merge_importado
  id = "i-0aa8897245c58dfea"
}

resource "aws_instance" "ec2_merge_importado" {
  tags = {
    Name = "ec2-existente"
    Tipo = "importado"
  }
  ami = "ami-051f8a213df8bc089"
  instance_type = "t2.large"
}


# main.tf
provider "aws" {
  region = "us-east-1"
}