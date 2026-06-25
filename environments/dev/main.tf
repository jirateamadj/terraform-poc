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
      name = "dev"
    }
  }
}
# Tmp
module "archivos" {
  source      = "../../modules/generador-archivos"
  ambiente    = "dev"
  propietario = var.nombre
  cantidad    = var.cantidad
  mensaje     = "Archivo de desarrollo - CI/CD activo"
}
