# Define el backend local
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}