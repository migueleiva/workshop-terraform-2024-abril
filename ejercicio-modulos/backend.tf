terraform {
  backend "s3" {
    bucket = "repositorio-estado-terraform-mleiva"
    key    = "ejercicio-modulos/terraform.tfstate"
    region = "us-east-1"
    //opcional para evitar bloqueos
    dynamodb_table = "terraform_state"
  }
}
