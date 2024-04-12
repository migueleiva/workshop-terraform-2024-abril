locals {
  # Define los nombres de recursos comunes como variables locales
  instance_name = "creada-para-locales"
  bucket_name = "bucket-creada-para-locales"
  
  # Define otros valores locales como la instancia AMI
  ami_id = "ami-051f8a213df8bc089"  # Cambia a una AMI válida para la región
}

resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = "t2.micro"
  tags = {
    Name = local.instance_name
  }
}

resource "aws_s3_bucket" "example" {
  bucket = local.bucket_name
  tags = {
    Name = local.bucket_name
  }
}
