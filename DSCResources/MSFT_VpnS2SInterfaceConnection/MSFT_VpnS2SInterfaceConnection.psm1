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
		Name = [System.String]
		Ensure = [System.String]
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	$Params = $PSBoundParameters
    $output = $Params.Remove('Debug')
    $output = $Params.Remove('Verbose')

    if ($Ensure -eq 'Present') {
        Connect-VpnS2SInterface @Params
    }
    if ($Ensure -eq 'Absent') {
        Disconnect-VpnS2SInterface
    }
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	$result = [System.Boolean]$true
    $VpnS2SInterfaceConnection = Get-VpnS2SInterface

	if ($Ensure -eq 'Present' -and $VpnS2SInterfaceConnection -eq $true) {
        $result = [System.Boolean]$true
    }
    if ($Ensure -eq 'Absent' -and $VpnS2SInterfaceConnection -eq $false) {
        $result = [System.Boolean]$true
    }
	
	$result
}


Export-ModuleMember -Function *-TargetResource

