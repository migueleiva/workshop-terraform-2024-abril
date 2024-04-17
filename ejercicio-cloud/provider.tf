terraform {
  cloud {
    organization = "braintcamp"
    #hostname = "app.terraform.io" # Optional; defaults to app.terraform.io
    workspaces {
      name = "ejercicio-cloud"
      #project = "braintcamp-devops"
      #tags = ["networking", "source:cli"]
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