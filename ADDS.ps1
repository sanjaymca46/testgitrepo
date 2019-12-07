Import-Module ServerManager
install-windowsfeature AD-Domain-Services -IncludeManagementTools
Import-Module ADDSDeployment
$Password = ConvertTo-SecureString "Sanjay@_007" -AsPlainText -Force
$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'Win2012R2'
    DomainName = 'bluebird.com'
    DomainNetbiosName = 'BLUEBIRD'
    ForestMode = 'Win2012R2'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
Install-ADDSForest @Params 