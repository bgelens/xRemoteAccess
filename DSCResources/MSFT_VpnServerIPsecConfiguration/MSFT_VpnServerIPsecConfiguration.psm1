function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType
	)

	$returnValue = @{
		AuthenticationTransformConstants = [System.String]
		CipherTransformConstants = [System.String]
		CustomPolicy = [System.String]
		DHGroup = [System.String]
		EncryptionMethod = [System.String]
		EncryptionType = [System.String]
		IdleDisconnectSeconds = [System.UInt32]
		Ikev2Ports = [System.UInt32]
		IntegrityCheckMethod = [System.String]
		L2tpPorts = [System.UInt32]
		PfsGroup = [System.String]
		SADataSizeForRenegotiationKilobytes = [System.UInt32]
		SALifeTimeSeconds = [System.UInt32]
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$EncryptionMethod,

		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.UInt32]
		$Ikev2Ports,

		[System.String]
		$IntegrityCheckMethod,

		[System.UInt32]
		$L2tpPorts,

		[System.String]
		$PfsGroup,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds
	)

    $Params = $PSBoundParameters
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')

    Set-VpnServerIPsecConfiguration @Params
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[System.String]
		$AuthenticationTransformConstants,

		[System.String]
		$CipherTransformConstants,

		[System.String]
		$CustomPolicy,

		[System.String]
		$DHGroup,

		[System.String]
		$EncryptionMethod,

		[parameter(Mandatory = $true)]
		[System.String]
		$EncryptionType,

		[System.UInt32]
		$IdleDisconnectSeconds,

		[System.UInt32]
		$Ikev2Ports,

		[System.String]
		$IntegrityCheckMethod,

		[System.UInt32]
		$L2tpPorts,

		[System.String]
		$PfsGroup,

		[System.UInt32]
		$SADataSizeForRenegotiationKilobytes,

		[System.UInt32]
		$SALifeTimeSeconds
	)

    $result = [System.Boolean]$true
    $VpnServerIPsecConfiguration = Get-VpnServerIPsecConfiguration

	if ($VpnServerIPsecConfiguration -eq $true) {
        $result = [System.Boolean]$true
    }
	
	$result
}


Export-ModuleMember -Function *-TargetResource

