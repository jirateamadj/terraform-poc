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
      tags = ["terraform-poc"]
    }
  }
}

locals {
  # terraform.workspace es una variable built-in (incorporada) que devuelve el nombre del workspace actual
  ambiente = terraform.workspace

  config = {
    dev = {
      cantidad = 2
      mensaje  = "Ambiente de desarrollo"
    }
    prod = {
      cantidad = 5
      mensaje  = "Ambiente de produccion"
    }
  }

  # Usa la config del ambiente actual, si no existe usa dev por defecto
  settings = lookup(local.config, local.ambiente, local.config["dev"])
}
# Push to github
module "archivos" {
  source      = "./modules/generador-archivos"
  ambiente    = local.ambiente
  propietario = var.nombre
  cantidad    = local.settings.cantidad
  mensaje     = local.settings.mensaje
}

resource "local_file" "bienvenida" {
  filename = "${path.module}/output/bienvenida.txt"
  content  = local.template
}

resource "local_file" "config_dump" {
  filename = "${path.module}/output/config-leida.txt"
  content  = "Configuracion leida del archivo existente:\n${data.local_file.configuracion.content}"
}
