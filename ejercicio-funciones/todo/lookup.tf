provider "aws" {
  region = "us-east-1"
}

# Define un mapa con configuraciones de subredes
variable "subnet_configs" {
  type = map(map(string))
  default = {
    "subnet1" = {
      id        = "subnet-12345678"
      cidr      = "10.0.1.0/24"
      az        = "us-east-1a"
    }
    "subnet2" = {
      id        = "subnet-87654321"
      cidr      = "10.0.2.0/24"
      az        = "us-east-1b"
    }
  }
}

# Usar `lookup` para obtener la configuración de la subred "subnet1"
output "subnet1_cidr" {
  value = lookup(var.subnet_configs, "subnet1", {})
}

# Crear una instancia EC2 utilizando `lookup` para obtener la subred
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # Usar `lookup` para obtener el ID de la subred "subnet1"
  subnet_id = lookup(var.subnet_configs["subnet1"], "id", "")

  tags = {
    Name = "ExampleInstance"
  }
}
