# ACPL USA Website Replica

Production-ready public website replica with redesigned visual identity, based on the source structure from acplusa.com.

## Live Structure
- Static site source: `frontend/`
- Published branch: `gh-pages`
- Deployment helper: `publish_to_github.ps1`

## Local Preview
```powershell
npx --yes serve frontend -l 5500
```

## Production Deployment (GitHub Pages)
1. Ensure the repository is public and GitHub Pages is configured to deploy from branch `gh-pages` at `/ (root)`.
2. Commit your changes to `main`.
3. Run the deployment helper:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\publish_to_github.ps1
```

4. The script pushes `main` and republishes `frontend/` to `gh-pages` using `git subtree`.

Expected live URL format:
`https://<github-username>.github.io/<repo-name>/`

Current live URL:
`https://rajha2157.github.io/reviseacplwebsite/`
