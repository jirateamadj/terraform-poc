output "archivos_creados" {
  description = "Lista de archivos que Terraform creo"
  value       = module.archivos.archivos
}

output "total_archivos" {
  description = "Cantidad total de archivos creados"
  value       = module.archivos.cantidad_creada
}

output "ambiente_activo" {
  description = "Workspace activo al momento del apply"
  value       = terraform.workspace
}
