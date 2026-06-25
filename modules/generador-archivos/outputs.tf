output "archivos" {
  description = "Rutas de los archivos creados"
  value       = local_file.archivos[*].filename
}

output "cantidad_creada" {
  value = var.cantidad
}
