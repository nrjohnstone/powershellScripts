#
#    SourceTree usage:
#        Set the script to run as powershell.exe
#        Set the parameters to be the path to this script and then $REPO
#
param(
		[string]$repo
)

# Get the current branch from the repository
Push-Location -Path $repo
$branch = git rev-parse --abbrev-ref HEAD

# Get the origin URL from the configuration to raise the pull request against
$origin = git config --get remote.origin.url

# Remove the .git from the end if present
$origin = $origin.Replace(".git","") 

# Get the default target repo for the pull request
$targetRepo = [Environment]::GetEnvironmentVariable("DefaultGitPullRequestRepo","User")

# Get the default target branch for pull requests
$defaultTargetBranch = [Environment]::GetEnvironmentVariable("DefaultGitPullRequestBranch","User")

# Check for a hyphen in the current branch and assume that the left part is the target branch
if ($branch -like "*-*")
{
    $targetBranch = $targetRepo + ":" + $branch.Split("-")[0];
}
elseif ($defaultTargetBranch)
{
    # Otherwise use the default git pull request branch from the environment variable
    $targetBranch = $defaultTargetBranch
}
# No target branch, try raising pull request to a matching current branch name against the default repo
else
{
    $targetBranch = $targetRepo + ":" + $branch
}

# Create the pull request URL 
If($targetBranch)
{
    $url = $origin + "/compare/" + $targetBranch + "..." + $branch + "?expand=1"	
}
else
{
	$url = $origin + "/compare/" + $branch + "?expand=1"
}

Start $url

Pop-Location
