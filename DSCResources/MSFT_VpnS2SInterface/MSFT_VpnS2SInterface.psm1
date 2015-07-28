function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name
	)

	$returnValue = @{
		AdminStatus = [System.Boolean]
		AuthenticationMethod = [System.String]
		AuthenticationTransformConstants = [System.String]
		Certificate = [System.String]
		CipherTransformConstants = [System.String]
		CustomPolicy = [System.String]
		DHGroup = [System.String]
		Destination = [System.String]
		EapMethod = [System.String]
		EnableQoS = [System.Boolean]
		EncryptionMethod = [System.String]
		EncryptionType = [System.String]
		Ensure = [System.String]
		IdleDisconnectSeconds = [System.UInt32]
		InitiateConfigPayload = [System.Boolean]
		IPv4Subnet = [System.String]
		IPv4TriggerFilter = [System.String[]]
		IPv4TriggerFilterAction = [System.String]
		IPv6Subnet = [System.String[]]
		IPv6TriggerFilter = [System.String[]]
		IPv6TriggerFilterAction = [System.String]
		IntegrityCheckMethod = [System.String]
		InternalIPv4 = [System.Boolean]
		InternalIPv6 = [System.Boolean]
		Name = [System.String]
		NetworkOutageTimeSeconds = [System.UInt32]
		NumberOfTries = [System.UInt32]
		Persistent = [System.Boolean]
		PfsGroup = [System.String]
		PostConnectionIPv4Subnet = [System.String[]]
		PostConnectionIPv6Subnet = [System.String[]]
		PromoteAlternate = [System.Boolean]
		Protocol = [System.String]
		RadiusAttributeClass = [System.String]
		ResponderAuthenticationMethod = [System.String]
		RetryIntervalSeconds = [System.UInt32]
		RoutingDomain = [System.String]
		RxBandwidthKbps = [System.UInt64]
		SADataSizeForRenegotiationKilobytes = [System.UInt32]
		SALifeTimeSeconds = [System.UInt32]
		SharedSecret = [System.String]
		SourceIpAddress = [System.String]
		ThrottleLimit = [System.UInt32]
		TxBandwidthKbps = [System.UInt64]
		User = [System.Management.Automation.PSCredential]
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[System.Boolean]
		$AdminStatus,

		[System.String]
		$AuthenticationMethod,

		[ValidateSet("SHA256128","MD596","SHA196","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$Certificate,

		[ValidateSet("DES","DES3","AES128","AES192","AES256","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$Destination,

		[System.String]
		$EapMethod,

		[System.Boolean]
		$EnableQoS,

		[System.String]
		$EncryptionMethod,

		[System.String]
		$EncryptionType,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.Boolean]
		$InitiateConfigPayload,

		[System.String]
		$IPv4Subnet,

		[System.String[]]
		$IPv4TriggerFilter,

		[System.String]
		$IPv4TriggerFilterAction,

		[System.String[]]
		$IPv6Subnet,

		[System.String[]]
		$IPv6TriggerFilter,

		[System.String]
		$IPv6TriggerFilterAction,

		[System.String]
		$IntegrityCheckMethod,

		[System.Boolean]
		$InternalIPv4,

		[System.Boolean]
		$InternalIPv6,

		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[System.UInt32]
		$NetworkOutageTimeSeconds,

		[System.UInt32]
		$NumberOfTries,

		[System.Boolean]
		$Persistent,

		[System.String]
		$PfsGroup,

		[System.String[]]
		$PostConnectionIPv4Subnet,

		[System.String[]]
		$PostConnectionIPv6Subnet,

		[System.Boolean]
		$PromoteAlternate,

		[System.String]
		$Protocol,

		[System.String]
		$RadiusAttributeClass,

		[System.String]
		$ResponderAuthenticationMethod,

		[System.UInt32]
		$RetryIntervalSeconds,

		[System.String]
		$RoutingDomain,

		[System.UInt64]
		$RxBandwidthKbps,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds,

		[System.String]
		$SharedSecret,

		[System.String]
		$SourceIpAddress,

		[System.UInt32]
		$ThrottleLimit,

		[System.UInt64]
		$TxBandwidthKbps,

		[System.Management.Automation.PSCredential]
		$User
	)
   
    $Params = $PSBoundParameters
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')

    if ($Ensure -eq 'Present') {
        Add-VpnS2SInterface @Params
        Set-VpnS2SInterface @Params
    }
    if ($Ensure -eq 'Absent') {
        Remove-VpnS2SInterface
    }
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[System.Boolean]
		$AdminStatus,

		[System.String]
		$AuthenticationMethod,

		[ValidateSet("SHA256128","MD596","SHA196","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$Certificate,

		[ValidateSet("DES","DES3","AES128","AES192","AES256","GCMAES128","GCMAES192","GCMAES256")]
		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$Destination,

		[System.String]
		$EapMethod,

		[System.Boolean]
		$EnableQoS,

		[System.String]
		$EncryptionMethod,

		[System.String]
		$EncryptionType,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.Boolean]
		$InitiateConfigPayload,

		[System.String]
		$IPv4Subnet,

		[System.String[]]
		$IPv4TriggerFilter,

		[System.String]
		$IPv4TriggerFilterAction,

		[System.String[]]
		$IPv6Subnet,

		[System.String[]]
		$IPv6TriggerFilter,

		[System.String]
		$IPv6TriggerFilterAction,

		[System.String]
		$IntegrityCheckMethod,

		[System.Boolean]
		$InternalIPv4,

		[System.Boolean]
		$InternalIPv6,

		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[System.UInt32]
		$NetworkOutageTimeSeconds,

		[System.UInt32]
		$NumberOfTries,

		[System.Boolean]
		$Persistent,

		[System.String]
		$PfsGroup,

		[System.String[]]
		$PostConnectionIPv4Subnet,

		[System.String[]]
		$PostConnectionIPv6Subnet,

		[System.Boolean]
		$PromoteAlternate,

		[System.String]
		$Protocol,

		[System.String]
		$RadiusAttributeClass,

		[System.String]
		$ResponderAuthenticationMethod,

		[System.UInt32]
		$RetryIntervalSeconds,

		[System.String]
		$RoutingDomain,

		[System.UInt64]
		$RxBandwidthKbps,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds,

		[System.String]
		$SharedSecret,

		[System.String]
		$SourceIpAddress,

		[System.UInt32]
		$ThrottleLimit,

		[System.UInt64]
		$TxBandwidthKbps,

		[System.Management.Automation.PSCredential]
		$User
	)

    $result = [System.Boolean]$true
    $VpnS2SInterface = Get-VpnS2SInterface

	if ($Ensure -eq 'Present' -and $VpnS2SInterface -eq $true) {
        $result = [System.Boolean]$true
    }
    if ($Ensure -eq 'Absent' -and $VpnS2SInterface -eq $false) {
        $result = [System.Boolean]$true
    }
	
	$result
}


Export-ModuleMember -Function *-TargetResource

