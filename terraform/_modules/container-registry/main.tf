##------------------------------------------------
## container registry module call
##------------------------------------------------
module "container-registry" {
  source                 = "terraform-do-modules/container-registry/digitalocean"
  version                = "1.0.1"
  name                   = var.name
  environment            = var.environment
  label_order            = var.label_order
  region                 = var.region
  enabled                = var.enabled
  subscription_tier_slug = var.subscription_tier_slug
}
