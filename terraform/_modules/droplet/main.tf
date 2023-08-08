##------------------------------------------------
## Droplet module call
##------------------------------------------------
module "droplet" {
  source      = "terraform-do-modules/droplet/digitalocean"
  version     = "1.0.0"
  name        = var.name
  environment = var.environment
  enabled     = var.enabled
  region      = var.region
  vpc_uuid    = var.vpc_id
  ssh_key     = var.ssh_key
  user_data   = var.user_data
  ####firewall
  inbound_rules = var.inbound_rules
}