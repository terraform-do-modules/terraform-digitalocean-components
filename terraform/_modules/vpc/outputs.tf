output "id" {
  value       = join("", module.vpc[*].id)
  description = "Name of SSH key."
}