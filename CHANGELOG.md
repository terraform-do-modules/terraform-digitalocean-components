## [v1.0.4] - 2026-09-17
### :bug: Bug Fixes
- [`68da45f`](https://github.com/terraform-do-modules/terraform-digitalocean-components/commit/68da45ffd66695b4c0634b93560ad7519b8b389c) - updated the automerge.yml *(commit by [@karan-cd](https://github.com/karan-cd))*

### :wrench: Chores
- [`1bbba58`](https://github.com/terraform-do-modules/terraform-digitalocean-components/commit/1bbba58e6115504e5162587e85e32f6d2d0beac5) - bump terraform.yml to 2.1.3 (Foundry: FOU-57) *(PR [#134](https://github.com/terraform-do-modules/terraform-digitalocean-components/pull/134) by [@clouddrove-ci](https://github.com/clouddrove-ci))*


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
[v1.0.4]: https://github.com/terraform-do-modules/terraform-digitalocean-components/compare/v1.0.3...v1.0.4
