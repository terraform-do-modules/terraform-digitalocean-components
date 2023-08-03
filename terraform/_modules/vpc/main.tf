##------------------------------------------------
## VPC module call
##------------------------------------------------
module "vpc" {
  source      = "terraform-do-modules/vpc/digitalocean"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  region      = var.region
  ip_range    = var.ip_range
}