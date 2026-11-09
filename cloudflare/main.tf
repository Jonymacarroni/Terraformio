provider "cloudflare" {
  api_token = var.api_token
}

# El módulo app agrupa la base D1, el Worker y su subdominio.
module "app" {
  source = "./modules/app"

  account_id       = var.account_id
  d1_database_name = var.d1_database_name
  worker_name      = var.worker_name
}

moved {
  from = cloudflare_d1_database.app
  to   = module.app.cloudflare_d1_database.app
}

moved {
  from = cloudflare_workers_script.app
  to   = module.app.cloudflare_workers_script.app
}

moved {
  from = cloudflare_workers_script_subdomain.app
  to   = module.app.cloudflare_workers_script_subdomain.app
}