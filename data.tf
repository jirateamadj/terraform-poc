locals {
  template = templatefile("${path.module}/templates/mensaje.tpl", {
    nombre   = var.nombre
    ambiente = "dev"
    fecha    = "2026-06-24"
  })
}

# data source — lee un archivo que YA EXISTE, no lo crea
data "local_file" "configuracion" {
  filename = "${path.module}/config/app.json"
}
