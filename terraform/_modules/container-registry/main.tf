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
  source                 = "./../../"
  name                   = local.name
  environment            = local.environment
  region                 = local.region
  subscription_tier_slug = "starter"
}
