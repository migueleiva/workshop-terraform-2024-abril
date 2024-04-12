# Recurso para crear una instancia EC2
resource "aws_instance" "example" {
  ami           = "ami-051f8a213df8bc089"  # Reemplaza con el ID de AMI que desees
  instance_type = "t2.micro"

  # Usar la subred seleccionada
  subnet_id = data.aws_subnet.subnet_default.id

  # Puedes agregar más configuraciones para la instancia EC2 aquí, como seguridad, almacenamiento, etc.
  tags = {
    Name = "ejemploDatasource"
  }
}
