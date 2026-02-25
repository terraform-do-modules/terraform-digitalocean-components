# VPC
output "vpc_id" {
  value       = module.vpc.id
  description = "The ID of the VPC."
}

# Droplet
output "droplet_name" {
  value       = module.droplet.name
  description = "The name of the Droplet."
}

output "droplet_id" {
  value       = module.droplet.id
  description = "The ID of the Droplet."
}

# Firewall
output "firewall_name" {
  value       = module.firewall.name
  description = "The name of the Firewall."
}

# Load Balancer
output "load_balancer_id" {
  value       = module.load_balancer.id
  description = "The ID of the Load Balancer."
}

# Container Registry
output "container_registry_name" {
  value       = module.container_registry.name
  description = "The name of the container registry."
}

# Kubernetes
output "kubernetes_id" {
  value       = module.kubernetes.id
  description = "The ID of the Kubernetes cluster."
}

output "kubernetes_endpoint" {
  value       = module.kubernetes.endpoint
  description = "The Kubernetes API server endpoint."
}

# Domain
output "domain_id" {
  value       = module.domain.id
  description = "The ID of the domain."
}

# CDN
output "cdn_id" {
  value       = module.cdn.id
  description = "The ID of the CDN endpoint."
}

# Certificate
output "certificate_id" {
  value       = module.certificate.id
  description = "The unique ID of the certificate."
}

output "certificate_name" {
  value       = module.certificate.name
  description = "The name of the certificate."
}

# Database
output "database_cluster_id" {
  value       = module.database.database_cluster_id
  description = "The ID of the database cluster."
}

output "database_cluster_host" {
  value       = module.database.database_cluster_host
  description = "The hostname of the database cluster."
}

output "database_cluster_uri" {
  value       = module.database.database_cluster_uri
  sensitive   = true
  description = "The full URI for connecting to the database cluster."
}

# Spaces
output "spaces_urn" {
  value       = module.spaces.urn
  description = "The URN of the Spaces bucket."
}

output "spaces_bucket_domain_name" {
  value       = module.spaces.bucket_domain_name
  description = "The domain name of the Spaces bucket."
}

# Monitoring
output "uptime_check_id" {
  value       = module.monitoring.uptime_check_id
  description = "The ID of the uptime check."
}

output "uptime_alert_id" {
  value       = module.monitoring.uptime_alert_id
  description = "The ID of the uptime alert."
}
