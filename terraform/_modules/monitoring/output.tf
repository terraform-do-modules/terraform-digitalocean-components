output "uptime_check_id" {
  value       = module.uptime-alert.uptime_alert_id
  description = " The id of the check."
}
output "uptime_alert_id" {
  value       = module.uptime-alert.uptime_check_id
  description = "The id of the alert."
}

output "uuid" {
  value       = module.uptime-alert.uuid
  description = "The uuid of the alert."
}