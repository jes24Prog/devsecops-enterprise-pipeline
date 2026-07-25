# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-07-25

### Added
- Complete Enterprise DevSecOps CI/CD Pipeline supporting PR validation, Main merges, Security audits, and Release workflows.
- Integration with SonarQube Community Edition for local and CI static analysis.
- Multi-stage security scanning with Trivy (Filesystem & Container), Semgrep (SAST), and Gitleaks (Secrets).
- Multi-stage Alpine/Nginx Docker containers with non-root user execution.
- Observability suite featuring Prometheus, Loki, Promtail, Grafana, and Uptime Kuma.
- Free Tier deployments for Vercel (Frontend) and Supabase (Backend Database & Auth).
