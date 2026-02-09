##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "terraform-do-modules/spaces/digitalocean"
  version       = "1.0.2"
  name          = var.name
  environment   = var.environment
  acl           = var.acl
  force_destroy = var.force_destroy
  region        = var.region
}