##------------------------------------------------
## app module call
##------------------------------------------------
module "app" {
  source  = "terraform-do-modules/app/digitalocean"
  version = "1.0.9"
  spec    = var.spec
  enabled = var.enabled
}
