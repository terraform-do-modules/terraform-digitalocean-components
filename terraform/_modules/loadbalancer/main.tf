##------------------------------------------------
## Load Balancer module call
##------------------------------------------------
module "load-balancer" {
  source      = "terraform-do-modules/load-balancer/digitalocean"
  version     = "1.0.3"
  enabled     = var.enabled
  name        = var.name
  environment = var.environment
  region      = var.region
  vpc_uuid    = var.vpc_uuid
  droplet_ids = var.droplet_ids
  ######
  enabled_redirect_http_to_https = var.enabled_redirect_http_to_https
  forwarding_rule                = var.forwarding_rule
  healthcheck                    = var.healthcheck
  sticky_sessions                = var.sticky_sessions
  firewall                       = var.firewall
}