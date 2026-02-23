##------------------------------------------------
## Domain module call
##------------------------------------------------
module "domain" {
  source  = "terraform-do-modules/domain/digitalocean"
  version = "1.0.3"
  name    = var.name
  enabled = var.enabled
  records = var.records
}