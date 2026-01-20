##------------------------------------------------
## mysql database cluster module call
##------------------------------------------------
module "mysql" {
  source                       = "terraform-do-modules/database/digitalocean"
  version                      = "1.0.1"
  name                         = var.name
  environment                  = var.environment
  enabled                      = var.enabled
  region                       = var.region
  cluster_engine               = var.cluster_engine
  cluster_version              = var.cluster_version
  cluster_size                 = var.cluster_size
  cluster_node_count           = var.cluster_node_count
  cluster_private_network_uuid = var.cluster_private_network_uuid
  mysql_sql_mode               = var.mysql_sql_mode
  cluster_maintenance          = var.cluster_maintenance
  databases                    = var.databases
  users                        = var.users
  create_firewall              = var.create_firewall
  firewall_rules               = var.firewall_rules
}