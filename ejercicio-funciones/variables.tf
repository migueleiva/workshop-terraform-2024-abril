# Define una lista de nombres de usuarios que quieres crear
variable "user_names" {
  description = "Lista de nombres de usuarios que se deben crear en AWS"
  type        = list(string)
  default     = ["cesar", "carlos", "rita"]
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