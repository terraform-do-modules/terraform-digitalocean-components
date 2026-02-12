##------------------------------------------------
## Firewall module call
##------------------------------------------------
module "firewall" {
  source        = "terraform-do-modules/firewall/digitalocean"
  version       = "1.0.2"
  enabled       = var.enabled
  name          = var.name
  environment   = var.environment
  label_order   = var.label_order
  allowed_ip    = var.allowed_ip
  allowed_ports = var.allowed_ports
  droplet_ids   = var.droplet_ids
}