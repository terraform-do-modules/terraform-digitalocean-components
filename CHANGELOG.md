## [1.0.2] - 2026-02-25

### 📚 Documentation
- Added `docs/architecture.md` — architecture guidance, module dependency order, and production patterns
- Added `docs/io.md` — full inputs/outputs reference for all 13 bundled modules

### 💡 Examples
- Added `_examples/complete/` — full-stack example compatible with Terraform >= 1.5.4 and OpenTofu >= 1.6.0
- Added `_examples/terragrunt/` — Terragrunt wrapper with DO Spaces remote state

### 👷 CI/CD & GitHub
- Added `.github/ISSUE_TEMPLATE/` — bug report, feature request, and config templates
- Added `SECURITY.md` — vulnerability reporting policy
- Added `CHANGELOG.md`
- Standardized all workflow SHA pins and removed `workflows.old/`
- Upgraded `.pre-commit-config.yaml` to gruntwork-io/pre-commit v0.1.23 and pre-commit-hooks v4.5.0

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
