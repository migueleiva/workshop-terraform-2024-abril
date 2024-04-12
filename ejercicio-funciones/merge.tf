
# Crear una instancia EC2 utilizando etiquetas combinadas
resource "aws_instance" "instance_merge" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = "t3.micro"
}

output "instancia_importada" {
  value = aws_instance.instance_merge
}