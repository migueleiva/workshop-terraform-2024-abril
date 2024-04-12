
# Leer la clave pública SSH del archivo usando `file`
resource "aws_key_pair" "key_pair" {
  key_name   = "example-key"
  public_key = file(var.ssh_key_file)

  tags = {
    Name = "Example Key Pair"
  }
}

# Crear una instancia EC2 y asociar la clave SSH
resource "aws_instance" "instance_file" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name  # Asignar la clave SSH a la instancia

  tags = {
    Name = "Ejemplo-File"
  }
}
