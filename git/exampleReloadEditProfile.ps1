
# Use . Reload-Profile to reload profile in current shell
function Reload-Profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }    
}

function Edit-Profile {
    ise c:\Users\njohnstone\Documents\WindowsPowerShell\profile.ps1
}