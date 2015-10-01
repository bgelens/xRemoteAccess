Configuration AzureS2S
{
    Import-DscResource -ModuleName 'xRemoteAccess','PSDesiredStateConfiguration'
    node localhost
    {
        LocalConfigurationManager        {            RebootNodeIfNeeded = $true        }
        WindowsFeature Routing
        {
            Ensure = 'Present'
            Name = 'Routing'

        }
        WindowsFeature RemoteAccessPowerShell
        {
            Ensure = 'Present'
            Name = 'RSAT-RemoteAccess-PowerShell'
            DependsOn = '[WindowsFeature]Routing'
        }
        Service RemoteAccess
        {
            Ensure = 'Present'
            Name = 'RemoteAccess'
            State = 'Running'
            DependsOn = '[WindowsFeature]Routing'
        }
        RemoteAccess VpnS2S
        {
            Ensure = 'Present'
            VpnType = 'VpnS2S'
            DependsOn = '[WindowsFeature]Routing'
        }
        VpnS2SInterface IKEv2
        {
            Ensure = 'Present'
            Protocol = 'IKEv2'
            AuthenticationMethod = 'PSKOnly'
            NumberOfTries = 3
            ResponderAuthenticationMethod = 'PSKOnly'
            Name = '104.209.36.168'
            Destination = '104.209.36.168'
            IPv4Subnet = '10.0.1.0/24:100'
            #This should accept array values
            SharedSecret = 'jclab5N6fYtWjp17ZfnObZTnEABTcbgH'
            InitiateConfigPayload = $false
            DependsOn = '[RemoteAccess]VpnS2S'
        }
        VpnServerIPsecConfiguration MaximumEncryption
        {
            EncryptionType = 'MaximumEncryption'
            DependsOn = '[VpnS2SInterface]IKEv2'
        }
        VpnS2SInterfaceConnection Connect
        {
            Ensure = 'Present'
            Name = '104.209.36.168'
            DependsOn = '[VpnServerIPsecConfiguration]MaximumEncryption'
        }
    }
}

AzureS2S -out c:\DSC\RRAS
Set-DscLocalConfigurationManager -Path c:\DSC\RRAS -Verbose
Start-DscConfiguration -Wait -Path c:\DSC\RRAS -Verbose