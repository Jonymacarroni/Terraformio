variable "account_id" {
  description = "Identificador de la cuenta de Cloudflare"
  type        = string
}

variable "api_token" {
  description = "Token de acceso a Cloudflare"
  type        = string
  sensitive   = true
}

variable "worker_name" {
  description = "Nombre del Worker"
  type        = string
}

variable "d1_database_name" {
  description = "Nombre de la base de datos D1"
  type        = string
}