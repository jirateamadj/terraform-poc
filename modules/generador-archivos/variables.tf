variable "ambiente" {
  type = string
}

variable "propietario" {
  type = string
}

variable "cantidad" {
  type    = number
  default = 2
}

variable "mensaje" {
  type    = string
  default = "Archivo generado por módulo."
}
