# Security Policy & Vulnerability Disclosure

## Supported Versions

We issue security patches for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0.0 | :x:                |

## Reporting a Vulnerability

We take the security of our software seriously. If you discover a security vulnerability, please follow responsible disclosure principles:

1. **Do NOT open a public GitHub issue** for critical security vulnerabilities.
2. Email your findings directly to `security@devsecops-pipeline.local` or submit via GitHub Private Vulnerability Reporting.
3. Include details of the vulnerability, steps to reproduce, and potential impact.

## Response & Patch SLA
- **Initial Response**: Within 24 hours.
- **Triage & Assessment**: Within 48 hours.
- **Patch Release SLA**:
  - **Critical**: Fix released within 72 hours.
  - **High**: Fix released within 7 business days.
  - **Medium/Low**: Fix released in next scheduled release.

## DevSecOps Compliance Controls
This project enforces automated security scanning on every Pull Request:
- **Secret Scanning**: Gitleaks prevents secret leakage.
- **SAST**: Semgrep and SonarQube evaluate code security & OWASP compliance.
- **SCA & Container Security**: Trivy scans filesystems and Docker images for CVEs.
