# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `docs/architecture.md` — architecture guidance and module dependency order
- `docs/io.md` — complete inputs and outputs reference for all 13 modules
- `_examples/complete/` — full-stack example compatible with Terraform >= 1.5.4 and OpenTofu >= 1.6.0
- `_examples/terragrunt/` — Terragrunt wrapper with DO Spaces remote state
- `.github/ISSUE_TEMPLATE/` — bug report, feature request, and config templates
- `SECURITY.md` — security policy and vulnerability reporting process
- Standardized GitHub Actions workflows with pinned SHA references

## [1.0.0] - 2023-07-25

### Added
- Initial release with component modules: vpc, droplet, database, kubernetes,
  container-registry, cdn, certificate, domain, firewall, loadbalancer,
  monitoring, spaces, app
- Sandbox environment under `terraform/sandbox/blr1/`
- `terraform.yml` workflow for manual apply/destroy with approval gating
