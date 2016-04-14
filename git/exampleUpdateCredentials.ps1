. .\Add-OSCCredential.ps1

	$Hosts = @(
	"some.example.host.com",
	"another.example.host.com")
	
Write-Host "You are about to add credentials for the following hosts."
foreach ($host in $Hosts) {
	Write-Host $host
}

while ([string]::IsNullOrEmpty($UserName))
{
	$UserName = Read-Host "UserName"
}
while ([string]::IsNullOrEmpty($Password))
{
	$Password = Read-Host "Password"
}

foreach ($host in $Hosts) {
	Add-OSCCredential -UserName $UserName -Password $Password -HostAddress $host	
}
