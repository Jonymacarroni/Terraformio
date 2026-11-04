provider "cloudflare" {
  api_token = var.api_token
}

resource "cloudflare_d1_database" "app" {
  account_id = var.account_id
  name       = var.d1_database_name
}

resource "cloudflare_workers_script" "app" {
  account_id         = var.account_id
  script_name        = var.worker_name
  main_module        = "worker.js"
  content_file       = "${path.module}/worker.js"
  content_sha256     = filesha256("${path.module}/worker.js")
  compatibility_date = "2025-10-28"

  bindings = [
    {
      name = "DB"
      type = "d1"
      id   = cloudflare_d1_database.app.id
    }
  ]
}

resource "cloudflare_workers_script_subdomain" "app" {
  account_id  = var.account_id
  script_name = cloudflare_workers_script.app.script_name
  enabled     = true
}