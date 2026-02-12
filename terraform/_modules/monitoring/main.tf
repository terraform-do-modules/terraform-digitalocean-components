##------------------------------------------------
## alert module call.
##------------------------------------------------
module "uptime-alert" {
  source      = "terraform-do-modules/monitoring/digitalocean"
  version     = "1.0.1"
  name        = var.name
  enabled     = var.enabled
  environment = var.environment
  target_url  = var.target_url
  type        = var.type
  alert_type  = var.alert_type
  period      = var.period
  comparison  = var.comparison
  ####
  notifications = var.notifications
}