##------------------------------------------------
## app module call
##------------------------------------------------
module "app" {
  source  = "terraform-do-modules/app/digitalocean"
  version = "1.0.0"
  spec    = var.spec
}