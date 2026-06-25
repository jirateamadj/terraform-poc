terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }

  cloud {
    organization = "Leinad"
    workspaces {
      name = "prod"
    }
  }
}

module "archivos" {
  source      = "../../modules/generador-archivos"
  ambiente    = "prod"
  propietario = var.nombre
  cantidad    = var.cantidad
  mensaje     = "Archivo de produccion"
}
