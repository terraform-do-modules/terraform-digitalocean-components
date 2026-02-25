# Architecture Guidance

This repository is a monorepo collection of DigitalOcean Terraform modules assembled into a single deployable stack. Each component under `terraform/_modules/` maps 1:1 to its dedicated standalone module repository.

## Structure

```
terraform-digitalocean-components/
├── terraform/
│   ├── _modules/          # Individual reusable module wrappers
│   │   ├── app/
│   │   ├── cdn/
│   │   ├── certificate/
│   │   ├── container-registry/
│   │   ├── database/
│   │   ├── domain/
│   │   ├── droplet/
│   │   ├── firewall/
│   │   ├── kubernetes/
│   │   ├── loadbalancer/
│   │   ├── monitoring/
│   │   ├── spaces/
│   │   └── vpc/
│   └── sandbox/
│       └── blr1/          # Example sandbox environment (Bangalore region)
└── app/
    └── k8s/               # Kubernetes manifests and Helm chart stubs
```

## Recommended Production Pattern

1. Use `terraform/sandbox/blr1` as a reference — copy it per environment (e.g. `prod/`, `staging/`).
2. Enable only the modules your environment requires by toggling the `enabled` variable per module.
3. Always wire `vpc_id`/`vpc_uuid` outputs from the VPC module into downstream modules (droplet, kubernetes, loadbalancer, database) to ensure network isolation.
4. Store sensitive outputs (database URIs, passwords) in a secrets manager — never in state files checked into version control.
5. Pin provider and module versions in `versions.tf` for reproducible deployments.

## Module Dependency Order

When deploying the full stack, provision in this order to satisfy inter-module dependencies:

```
VPC → SSH Key → Droplet → Firewall
    ↘ Database
    ↘ Kubernetes → Container Registry
    ↘ Load Balancer
    ↘ Spaces → CDN → Certificate
    ↘ Domain
    ↘ Monitoring
```

## Operational Checklist

- Run `terraform plan` from `terraform/sandbox/blr1` before every apply.
- Validate all module versions are aligned with their standalone repos before release.
- Use the `terraform.yml` workflow (`workflow_dispatch`) for manual apply/destroy with approval gating.
- Enable `create_firewall` on the database module in production to restrict access to known CIDRs.
- Review `checkov` and `tflint` CI results on every PR before merging.
