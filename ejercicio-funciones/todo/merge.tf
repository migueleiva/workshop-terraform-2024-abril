provider "aws" {
  region = "us-east-1"
}

# Define un mapa con etiquetas base
variable "base_tags" {
  type = map(string)
  default = {
    Environment = "Production"
    Project     = "ExampleProject"
  }
}

# Define un mapa con etiquetas adicionales
variable "additional_tags" {
  type = map(string)
  default = {
    Owner = "John Doe"
    Department = "IT"
  }
}

# Crear una instancia EC2 utilizando etiquetas combinadas
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = merge(var.base_tags, var.additional_tags, {
    Name = "ExampleInstance"
  })
}
