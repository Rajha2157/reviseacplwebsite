# ACPL USA Website Replica

Production-ready public website replica with redesigned visual identity, based on the source structure from acplusa.com.

## Live Structure
- Static site source: `frontend/`
- Auto-deploy workflow: `.github/workflows/deploy-pages.yml`

## Local Preview
```powershell
npx --yes serve frontend -l 5500
```

## Production Deployment (GitHub Pages)
1. Push this repository to a public GitHub repo.
2. In repository settings, ensure **Pages** source is set to **GitHub Actions**.
3. Push to `main` branch.
4. Workflow deploys site from `frontend/` automatically.

Expected live URL format:
`https://<github-username>.github.io/<repo-name>/`
