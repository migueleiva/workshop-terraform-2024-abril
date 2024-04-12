provider "aws" {
  region = "us-east-1"
}

# Definir variables para el nombre del bucket
variable "bucket_name" {
  type        = string
  description = "Nombre del bucket de S3"
}

# Usar `coalesce` para establecer un nombre predeterminado si `bucket_name` no está definido
resource "aws_s3_bucket" "example" {
  bucket = coalesce(var.bucket_name, "default-bucket-name")

  tags = {
    Name = "Example S3 Bucket"
  }
}
