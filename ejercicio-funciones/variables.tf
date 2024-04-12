# Define una lista de nombres de usuarios que quieres crear
variable "user_names" {
  description = "Lista de nombres de usuarios que se deben crear en AWS"
  type        = list(string)
  default     = ["cesar", "gina", "rita","carlos"]
}

# Define una lista con los nombres de los usuarios que quieres crear
variable "user_names2" {
  description = "Lista de nombres de usuarios que se deben crear en AWS"
  type        = list(string)
}

# Define variables de entrada
variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
}

variable "environment" {
  type        = string
  description = "Entorno (ej. Development, Production)"
}
# Define la ruta al archivo de clave SSH
variable "ssh_key_file" {
  type        = string
  description = "Ruta al archivo de clave SSH"
}


variable "tags" {
  type = map(string)
  default = {
    "Name"    = "MyInstance"
    "Owner"   = "TeamA"
    "Project" = "Terraform"
  }
}


variable "instance_config" {
  type = map(any)
  default = {
    "instance_type" = "t2.micro"
    "ami_id" = "ami-0c55b159cbfafe1f0"
  }
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
    Owner = "Miguel Leiva"
    Department = "Brain Tech"
  }
}