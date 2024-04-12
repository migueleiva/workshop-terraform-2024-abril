variable "instance_type" {
  type        = string
  description = "Tipo de instancia de AWS EC2"
  default     = "t2.micro"

  # Validación de la variable
  validation {
    condition = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "El tipo de instancia debe ser 't2.micro', 't2.small' o 't2.medium'."
  }
}

resource "aws_instance" "example" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
