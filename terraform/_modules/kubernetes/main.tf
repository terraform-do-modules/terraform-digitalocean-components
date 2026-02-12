##------------------------------------------------
## Kubernetes module call
##------------------------------------------------
module "kubernetes" {
  source             = "terraform-do-modules/kubernetes/digitalocean"
  version            = "1.1.3"
  name               = var.name
  environment        = var.environment
  region             = var.region
  enabled            = var.enabled
  cluster_version    = var.cluster_version
  vpc_uuid           = var.vpc_uuid
  critical_node_pool = var.critical_node_pool
  app_node_pools     = var.app_node_pools
}