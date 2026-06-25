locals {
  prefijo = "${var.ambiente}-${var.propietario}"
}

resource "local_file" "archivos" {
  count    = var.cantidad
  filename = "${path.root}/output/${local.prefijo}-${count.index + 1}.txt"
  content  = "[${var.ambiente}] ${var.mensaje} — #${count.index + 1} de ${var.cantidad}"
}
