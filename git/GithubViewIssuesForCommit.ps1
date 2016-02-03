param(
		[string]$repo,
		[string]$sha
)

# Set
Push-Location -Path $repo

# Get the current branch from the repo
$branch=git rev-parse --abbrev-ref HEAD

# Get the origin URL from the configuration
$origin=git config --get remote.origin.url

# Remove the .git from the end if present
$origin=$origin.Replace(".git","") 

$defaultGitUrl = [Environment]::GetEnvironmentVariable("DefaultGitUrl","User")

$url = $defaultGitUrl + "/search?q=" + $sha + "&type=Issues"

Start $url

Pop-Location
