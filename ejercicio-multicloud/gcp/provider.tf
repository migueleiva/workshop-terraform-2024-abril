terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.64, < 6"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.64, < 6"
    }
  }
}

# Define el provider de Google Cloud Platform
provider "google" {
  #credentials = file("/ruta/a/tu/archivo-de-credenciales.json")
  #Buscar la variable de entorno GOOGLE_APPLICATION_CREDENTIALS
  #export GOOGLE_APPLICATION_CREDENTIALS = /Users/miguelleivamartinez/Downloads/sa-terraform.json 
  project = "tonal-carving-415304"
  region  = "us-central1"
  zone    = "us-central1-a"
}