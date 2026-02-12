##------------------------------------------------
## lets_encrypt certificate module call
##------------------------------------------------
module "lets_encrypt_certificate" {
  source           = "terraform-do-modules/certificate/digitalocean"
  version          = "1.0.1"
  enabled          = var.enabled
  certificate_name = var.certificate_name
  domain_names     = var.domain_names
}