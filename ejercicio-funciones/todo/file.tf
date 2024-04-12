provider "aws" {
  region = "us-east-1"
}

# Define la ruta al archivo de clave SSH
variable "ssh_key_file" {
  type        = string
  description = "Ruta al archivo de clave SSH"
}

# Leer la clave pública SSH del archivo usando `file`
resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = file(var.ssh_key_file)

  tags = {
    Name = "Example Key Pair"
  }
}

# Crear una instancia EC2 y asociar la clave SSH
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example.key_name  # Asignar la clave SSH a la instancia

  tags = {
    Name = "Example Instance"
  }
}
