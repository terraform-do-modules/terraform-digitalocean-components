##------------------------------------------------
## Domain module call
##------------------------------------------------
module "domain" {
  source  = "terraform-do-modules/domain/digitalocean"
  version = "1.0.0"
  name    = var.name
  enabled = var.enabled
  records = var.records
}