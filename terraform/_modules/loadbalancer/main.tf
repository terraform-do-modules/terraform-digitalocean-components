provider "digitalocean" {
  spaces_access_id="DO00D9T9K4ZHVQ2LHXNJ"
  spaces_secret_key="kNCVAvxw9xk0eE1RamFoMbcY2m1jucW8YdzwzpgAVyc"
}

locals {
  name        = "app"
  environment = "test"
  region      = "blr1"
}

##------------------------------------------------
## VPC module call
##------------------------------------------------
module "vpc" {
  source      = "terraform-do-modules/vpc/digitalocean"
  version     = "1.0.0"
  name        = local.name
  environment = local.environment
  region      = local.region
  ip_range    = "10.10.0.0/16"
}

##------------------------------------------------
## Droplet module call
##------------------------------------------------
module "droplet" {
  source        = "terraform-do-modules/droplet/digitalocean"
  version       = "1.0.0"
  droplet_count = 2
  name          = local.name
  environment   = local.environment
  region        = local.region
  vpc_uuid      = module.vpc.id
  ssh_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbnaeXI+pAfwoMBLDl2r+fsRrBoqgRY54gcAawz0XJOiG6esHa13r28GGuEyAm5UGhDkVm6PZ8JAmLNpe8BTjJzF3BEZb+MMf0YLG+Gz6V5uyz9efuKxZqNTk2El36y5Z2dDUyrcT6FdayhRGtJPfUJc22tgucaTwA0I41SVJDb6OPeSYFalWIHk953RePWnJAjpRKyRqjnkbn6VUCqVQSNdJ+C4Qs7Zydullusm45UOMjhi20dgttdnnz6y9AOJDLws5IVmiee+Qwt1jO86RYSGyN2ikJQa6zB7Si1b8hlrVvDkBVGSxKs2mMJuLjXSx/SqdcwW17CDZLQoJ03WJgW3vs2sriyrtsFxWHCjssidl0sF83qVvUEsJKyNo7A6cXTAC++n2HlmWiDFpAns7qCrMkBJPOIT3hKDROozU+sLH8AL/mNd4yGpdTKDQGf+nDWq/5EGkHO4aq9RW9gQbGCX6H/zQTYudaDKLoVGf5LkYWtOC8+wfWmf2/dUA1KDU= devops"
  user_data     = file("user-data.sh")
  ####firewall
  inbound_rules = [
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "22"
    },
    {
      allowed_ip    = ["0.0.0.0/0"]
      allowed_ports = "80"
    }
  ]
}

##------------------------------------------------
## Load Balancer module call
##------------------------------------------------
module "load-balancer" {
  source      = "./../../"
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
## Firewall module call
##------------------------------------------------
module "firewall" {
  source        = "terraform-do-modules/firewall/digitalocean"
  version       = "1.0.0"
  name          = local.name
  environment   = local.environment
  allowed_ip    = ["0.0.0.0/0"]
  allowed_ports = [80, 443]
  droplet_ids   = module.droplet.id
}

module "spaces" {
  source        = "terraform-do-modules/spaces/digitalocean"
  version       = "1.0.0"
  name          = "testspace01"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"

}
