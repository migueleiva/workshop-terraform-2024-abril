terraform {
  cloud {
    #valores entregados por el workspace de terraform cloud
    organization = "braintcamp"
    workspaces {
      name = "ejercicio-cloud-2"
    }
  }
}

//Brain Tech
//Ejercicio inicial
//Captura las credenciales del archivo config
provider "aws" {
  //profile    = "default"
  region     = "us-east-1"
}