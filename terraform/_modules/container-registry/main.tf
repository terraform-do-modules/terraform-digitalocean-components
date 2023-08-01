provider "digitalocean" {}

locals {
  name        = "app"
  environment = "test"
  region      = "syd1"
}

##------------------------------------------------
## container registry module call
##------------------------------------------------
module "container-registry" {
  source                 = "terraform-do-modules/container-registry/digitalocean"
  version                = "1.0.0"
  name                   = local.name
  environment            = local.environment
  region                 = local.region
  subscription_tier_slug = "starter"
}
