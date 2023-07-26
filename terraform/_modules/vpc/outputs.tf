output "urn" {
  value       = join("", module.vpc[*].urn)
  description = "Name of SSH key."
}