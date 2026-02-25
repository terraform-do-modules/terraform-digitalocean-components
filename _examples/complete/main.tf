##------------------------------------------------
## Complete example — all DigitalOcean components
##
## Compatible with Terraform >= 1.5.4 and OpenTofu >= 1.6.0
##
## Usage:
##   export DIGITALOCEAN_TOKEN="<your-token>"
##   terraform init   # or: tofu init
##   terraform plan   # or: tofu plan
##   terraform apply  # or: tofu apply
##------------------------------------------------

provider "digitalocean" {}

locals {
  name        = var.name
  environment = var.environment
  region      = var.region
}

##------------------------------------------------
## VPC
##------------------------------------------------
module "vpc" {
  source      = "../../terraform/_modules/vpc"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.11.0.0/16"
}

##------------------------------------------------
## Spaces (Object Storage)
##------------------------------------------------
module "spaces" {
  source        = "../../terraform/_modules/spaces"
  name          = local.name
  environment   = local.environment
  region        = "nyc3"
  acl           = "private"
  force_destroy = false
}

##------------------------------------------------
## Droplet
##------------------------------------------------
module "droplet" {
  source      = "../../terraform/_modules/droplet"
  name        = local.name
  environment = local.environment
  region      = local.region
  vpc_id      = module.vpc.id

  ssh_keys = {
    key1 = {
      name       = "${local.name}-key"
      public_key = var.ssh_public_key
    }
  }

  inbound_rules = [
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "22"
    }
  ]
}

##------------------------------------------------
## Firewall
##------------------------------------------------
module "firewall" {
  source        = "../../terraform/_modules/firewall"
  name          = local.name
  environment   = local.environment
  allowed_ip    = ["0.0.0.0/0"]
  allowed_ports = [80, 443]
  droplet_ids   = module.droplet.id
}

##------------------------------------------------
## Load Balancer
##------------------------------------------------
module "load_balancer" {
  source      = "../../terraform/_modules/loadbalancer"
  name        = local.name
  environment = local.environment
  region      = local.region
  vpc_uuid    = module.vpc.id
  droplet_ids = module.droplet.id

  enabled_redirect_http_to_https = false

  forwarding_rule = [
    {
      entry_port      = 80
      entry_protocol  = "http"
      target_port     = 80
      target_protocol = "http"
    }
  ]

  healthcheck = [
    {
      port                     = 80
      protocol                 = "http"
      check_interval_seconds   = 10
      response_timeout_seconds = 5
      unhealthy_threshold      = 3
      healthy_threshold        = 5
    }
  ]
}

##------------------------------------------------
## Container Registry
##------------------------------------------------
module "container_registry" {
  source                 = "../../terraform/_modules/container-registry"
  name                   = local.name
  environment            = local.environment
  subscription_tier_slug = "starter"
}

##------------------------------------------------
## Kubernetes
##------------------------------------------------
module "kubernetes" {
  source          = "../../terraform/_modules/kubernetes"
  name            = local.name
  environment     = local.environment
  region          = local.region
  cluster_version = "1.27.4-do.0"
  vpc_uuid        = module.vpc.id

  critical_node_pool = {
    critical_node = {
      node_count = 1
      min_nodes  = 1
      max_nodes  = 2
      size       = "s-1vcpu-2gb"
      labels     = { "role" = "critical" }
      tags       = [local.environment]
    }
  }

  app_node_pools = {
    app_node = {
      size       = "s-1vcpu-2gb"
      node_count = 1
      min_nodes  = 1
      max_nodes  = 3
      labels     = { "role" = "application" }
      tags       = [local.environment]
    }
  }
}

##------------------------------------------------
## Domain & DNS Records
##------------------------------------------------
module "domain" {
  source = "../../terraform/_modules/domain"
  name   = var.domain_name

  records = {
    record_lb = {
      type  = "A"
      name  = "@"
      value = module.load_balancer.id
    }
    record_www = {
      type  = "CNAME"
      name  = "www"
      value = "@"
    }
  }
}

##------------------------------------------------
## CDN (backed by Spaces)
##------------------------------------------------
module "cdn" {
  depends_on = [module.spaces]
  source     = "../../terraform/_modules/cdn"
  origin     = module.spaces.bucket_domain_name
  ttl        = 3600
}

##------------------------------------------------
## Let's Encrypt Certificate
##------------------------------------------------
module "certificate" {
  source           = "../../terraform/_modules/certificate"
  certificate_name = local.name
  domain_names     = var.certificate_domain_names
}

##------------------------------------------------
## MySQL Database Cluster
##------------------------------------------------
module "database" {
  source                       = "../../terraform/_modules/database"
  name                         = local.name
  environment                  = local.environment
  region                       = local.region
  cluster_engine               = "mysql"
  cluster_version              = "8"
  cluster_size                 = "db-s-1vcpu-1gb"
  cluster_node_count           = 1
  cluster_private_network_uuid = module.vpc.id

  cluster_maintenance = {
    maintenance_hour = "02:00:00"
    maintenance_day  = "saturday"
  }

  databases = ["appdb"]

  users = [
    {
      name              = "appuser"
      mysql_auth_plugin = "mysql_native_password"
    }
  ]

  create_firewall = false
}

##------------------------------------------------
## Monitoring / Uptime Alerts
##------------------------------------------------
module "monitoring" {
  source      = "../../terraform/_modules/monitoring"
  name        = local.name
  environment = local.environment
  target_url  = ["https://${var.domain_name}/"]
  type        = ["https"]
  alert_type  = ["down_global"]
  period      = ["2m"]
  comparison  = ["less_than"]

  notifications = [
    {
      email = var.alert_email
    }
  ]
}
