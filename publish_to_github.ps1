param(
  [string]$Remote = 'origin',
  [string]$PagesBranch = 'gh-pages'
)

$ErrorActionPreference = 'Stop'

function Invoke-Git {
  param(
    [Parameter(Mandatory = $true)]
    [string[]]$Arguments
  )

  & git @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw ('git ' + ($Arguments -join ' ') + ' failed with exit code ' + $LASTEXITCODE)
  }
}

Write-Host 'Validating repository state...'
Invoke-Git -Arguments @('rev-parse', '--is-inside-work-tree')

$remoteUrl = (& git remote get-url $Remote).Trim()
if ($LASTEXITCODE -ne 0 -or -not $remoteUrl) {
  throw "Remote '$Remote' is not configured."
}

$status = (& git status --short).Trim()
if ($LASTEXITCODE -ne 0) {
  throw 'Unable to read git status.'
}

if ($status) {
  throw 'Working tree is not clean. Commit or stash changes before publishing.'
}

Write-Host 'Pushing main branch...'
Invoke-Git -Arguments @('push', $Remote, 'main')

Write-Host 'Publishing frontend to GitHub Pages branch...'
Invoke-Git -Arguments @('subtree', 'push', '--prefix', 'frontend', $Remote, $PagesBranch)

$pagesUrl = $null
if ($remoteUrl -match 'github\.com[:/](?<owner>[^/]+)/(?<repo>[^/.]+)(?:\.git)?$') {
  $owner = $Matches['owner']
  $repo = $Matches['repo']
  $pagesUrl = "https://$owner.github.io/$repo/"
}

Write-Host 'Publish complete.'
if ($pagesUrl) {
  Write-Host ('Live URL: ' + $pagesUrl)
}
