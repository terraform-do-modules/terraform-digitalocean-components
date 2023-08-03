##------------------------------------------------
## cdn module call
##------------------------------------------------
module "cdn" {
  source           = "terraform-do-modules/cdn/digitalocean"
  version          = "1.0.0"
  enabled          = var.enabled
  origin           = var.origin
  ttl              = var.ttl
  custom_domain    = var.custom_domain
  certificate_name = var.certificate_name
}