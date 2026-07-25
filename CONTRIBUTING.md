# Contributing Guidelines

Thank you for contributing to the DevSecOps Enterprise Pipeline project!

## Branching Strategy & Workflow
We follow a GitFlow / Feature Branching Model:
- `main`: Production-ready code only. Direct commits are blocked.
- `develop`: Development branch for integrating feature branches.
- `feature/*`: Feature development branches created from `develop`.
- `hotfix/*`: Production hotfixes created from `main`.
- `release/*`: Release candidate branches.

## Conventional Commits
All commit messages MUST adhere to the [Conventional Commits](https://www.conventionalcommits.org/) specification:

- `feat: add new rate-limiting middleware`
- `fix: resolve CORS policy header mismatch`
- `sec: update Trivy scanner ruleset`
- `docs: update deployment setup instructions`
- `ci: configure SonarQube quality gate workflow`

## DevSecOps PR Requirements
Before opening a Pull Request:
1. Run local security scans: `bash scripts/run-security-scans.sh`
2. Run test suites: `npm test`
3. Ensure no hardcoded secrets or raw credentials exist.
4. Pass all automated GitHub Actions checks.
