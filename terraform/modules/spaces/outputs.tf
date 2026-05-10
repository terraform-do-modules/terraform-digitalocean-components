# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "urn" {
  value       = module.spaces.urn
  description = "Name of SSH key."
}

output "name" {
  value       = module.spaces.name
  description = "Name of SSH key."
}

output "bucket_domain_name" {
  value       = module.spaces.bucket_domain_name
  description = "Name of SSH key."
}
