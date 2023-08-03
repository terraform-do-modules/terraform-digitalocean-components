provider "digitalocean" {}

locals {
  name        = "app-component"
  environment = "test"
  region      = "blr1"
}

module "vpc" {
  source      = "./../../_modules/vpc"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.11.0.0/16"
}

module "spaces" {
  source = "./../../_modules/spaces"

  name          = "space-component"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"
}

##------------------------------------------------
## Droplet module call
##------------------------------------------------
module "droplet" {
  source      = "./../../_modules/droplet"
  name        = local.name
  environment = local.environment
  region      = local.region
  vpc_id      = module.vpc.id
  ssh_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbnaeXI+pAfwoMBLDl2r+fsRrBoqgRY54gcAawz0XJOiG6esHa13r28GGuEyAm5UGhDkVm6PZ8JAmLNpe8BTjJzF3BEZb+MMf0YLG+Gz6V5uyz9efuKxZqNTk2El36y5Z2dDUyrcT6FdayhRGtJPfUJc22tgucaTwA0I41SVJDb6OPeSYFalWIHk953RePWnJAjpRKyRqjnkbn6VUCqVQSNdJ+C4Qs7Zydullusm45UOMjhi20dgttdnnz6y9AOJDLws5IVmiee+Qwt1jO86RYSGyN2ikJQa6zB7Si1b8hlrVvDkBVGSxKs2mMJuLjXSx/SqdcwW17CDZLQoJ03WJgW3vs2sriyrtsFxWHCjssidl0sF83qVvUEsJKyNo7A6cXTAC++n2HlmWiDFpAns7qCrMkBJPOIT3hKDROozU+sLH8AL/mNd4yGpdTKDQGf+nDWq/5EGkHO4aq9RW9gQbGCX6H/zQTYudaDKLoVGf5LkYWtOC8+wfWmf2/dUA1KDU= devops"
  user_data   = file("user-data.sh")
  ####firewall
  inbound_rules = [
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "22"
    }
  ]
}

# ##------------------------------------------------
# ## Firewall module call
# ##------------------------------------------------
module "firewall" {
  source        = "./../../_modules/firewall"
  name          = local.name
  environment   = local.environment
  allowed_ip    = ["0.0.0.0/0"]
  allowed_ports = [80, 443]
  droplet_ids   = module.droplet.id
}

# ##------------------------------------------------
# ## Load Balancer module call
# ##------------------------------------------------
module "load-balancer" {
  source      = "./../../_modules/loadbalancer"
  name        = local.name
  environment = local.environment
  region      = local.region
  vpc_uuid    = module.vpc.id
  droplet_ids = module.droplet.id
  ######
  enabled_redirect_http_to_https = false
  forwarding_rule = [
    {
      entry_port      = 80
      entry_protocol  = "http"
      target_port     = 80
      target_protocol = "http"
    },
    {
      entry_port       = 443
      entry_protocol   = "https"
      target_port      = 80
      target_protocol  = "http"
      certificate_name = "demo"
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
  sticky_sessions = [
    {
      type               = "cookies"
      cookie_name        = "lb-cookie"
      cookie_ttl_seconds = 300
    }
  ]

  firewall = [
    {
      deny  = ["cidr:0.0.0.0/0"]
      allow = ["cidr:143.244.136.144/32"]
    }
  ]
}

##------------------------------------------------
## container registry module call
##------------------------------------------------
module "container-registry" {
  source                 = "./../../_modules/container-registry"
  name                   = local.name
  environment            = local.environment
  subscription_tier_slug = "starter"
}

##------------------------------------------------
## Kubernetes module call
##------------------------------------------------
module "k8s" {
  source          = "./../../_modules/kubernetes"
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
      labels     = { "cluster" = "critical", }
      tags       = ["demo"]
      # taint = [
      #   {
      #     key    = "name"
      #     value  = "default"
      #     effect = "NoSchedule"
      #   }
      # ]
    }
  }

  app_node_pools = {
    app_node = {
      size       = "s-1vcpu-2gb"
      node_count = 1
      min_nodes  = 1
      max_nodes  = 2
      labels     = { "cluster" = "application" }
      tags       = ["demo"]
      taint = [
        {
          key    = "mysize"
          value  = "large"
          effect = "NoSchedule"
        }
      ]
    }
  }
}

##------------------------------------------------
## Domain module call
##------------------------------------------------
module "domain" {
  source = "./../../_modules/domain"
  name   = "component.test.com"

  records = {
    record1 = {
      type  = "A"
      name  = "test"
      value = "192.168.0.12"
    },
    record2 = {
      type  = "A"
      name  = "demo2"
      value = "192.168.0.13"
    },
  }
}

##------------------------------------------------
## alert module call.
##------------------------------------------------
module "uptime-alert" {
  source      = "./../../_modules/monitoring"
  name        = "app"
  environment = "test"
  target_url  = ["http://test.do.clouddrove.ca/", "https://test2.do.clouddrove.ca/"]
  type        = ["http", "https"]
  alert_type  = ["down_global"]
  period      = ["2m", "3m"]
  comparison  = ["less_than"]
  ####
  notifications = [
    {
      email = ["hello@clouddrove.com"]
      slack = [
        {
          channel = "testing"
          url     = "https://hooks.slack.com/services/TEXXXXXXXXxxxxYTGH8DNkjgggyKipj"
        }
      ]
    }
  ]
}

##------------------------------------------------
## lets_encrypt certificate module call
##------------------------------------------------
module "lets_encrypt_certificate" {
  source           = "./../../_modules/certificate"
  certificate_name = "test"
  domain_names     = ["do.clouddrove.ca"]
}

##------------------------------------------------
## cdn module call
##------------------------------------------------
module "cdn" {
  depends_on       = [module.spaces]
  source           = "./../../_modules/cdn"
  origin           = module.spaces.bucket_domain_name
  ttl              = 3600
  custom_domain    = ""
  certificate_name = ""
}
