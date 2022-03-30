# Copyright © 2022 Sergei S. Betke

<#
	.SYNOPSIS
		Create ReleaseNotes.md from ChangeLog.md
#>

[CmdletBinding()]

Param(

	# Param description
	[Parameter( Mandatory = $False )]
	[System.String]
	$ParamId = 'World',

	# Expected module version
	[Parameter( Mandatory = $False )]
	[System.String]
	$Version

)

Import-Module $PSScriptRoot/lib/GitHubActionsCore -Verbose:$false;

try
{
	Enter-ActionOutputGroup -Name 'Prepare repositories';
	try
	{
		Set-PSRepository -Name PSGallery -InstallationPolicy Trusted;
		Register-PackageSource -Name 'nuget.org' -Location 'https://api.nuget.org/v3/index.json' -ProviderName NuGet -Trusted -Force | Out-Null;
	}
	finally
	{
		Exit-ActionOutputGroup;
	};

	$ModuleName = 'PSDepend';
	Enter-ActionOutputGroup -Name "Install $ModuleName";
	try
	{
		if ( $Version -and ( $Version -ne 'latest' ) )
		{
			$installModParams.Add( 'RequiredVersion', $Version );
		}
		else
		{
			$Version = $null;
		};

		Write-ActionInfo ( 'checking for {0} module...' -f $ModuleName );

		$modules = Get-Module -ListAvailable -Name $ModuleName;
		$requiredModule = $null;
		if ( $Version )
		{
			$requiredModule = $modules | Where-Object { $_.Version -eq $Version };
		}
		else
		{
			$requiredModule = $modules | Sort-Object Version | Select-Object -Last 1;
		};

		if ( $requiredModule )
		{
			Write-ActionInfo ('{0} module version {1} already installed.' -f $requiredModule.Name, $requiredModule.Version);
		}
		else
		{
			Write-ActionInfo ( 'installing {0} module...' -f $ModuleName );
			$ProgressPreference = 'SilentlyContinue';
			$requiredModule = Install-Module @installModuleParams -PassThru;
			Write-ActionInfo ('{0} module version {1} installed.' -f $requiredModule.Name, $requiredModule.Version);
		};

		Import-Module @installModuleParams;
	}
	finally
	{
		Exit-ActionOutputGroup;
	};

	Invoke-CmdLet `
		-ParamId $ParamId  `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true );

	Set-ActionOutput -Name 'output-id' -Value $OutputId;
}
catch
{
	Set-ActionOutput 'error' $_.ToString();
	$ErrorView = 'NormalView';
	Set-ActionFailed ($_ | Out-String);
}
exit [System.Environment]::ExitCode;
