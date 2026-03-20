$ErrorActionPreference = 'Stop'

$repoName = 'acplusa-client-demo'
$description = 'Production-ready ACPL USA website replica for client demo'

$gh = 'C:\Program Files\GitHub CLI\gh.exe'
if (-not (Test-Path $gh)) {
  throw 'GitHub CLI not found at C:\Program Files\GitHub CLI\gh.exe'
}

Write-Host 'Checking GitHub auth...'
& $gh auth status

Write-Host 'Creating public repository if missing...'
& $gh repo create $repoName --public --description $description --source . --remote origin --push

Write-Host 'Setting Pages source to GitHub Actions...'
& $gh api -X POST repos/:owner/$repoName/pages -f build_type=workflow

Write-Host 'Done. Repository and Pages workflow setup complete.'
Write-Host 'Next: add a Pages workflow if needed for static deploy.'
