[CmdletBinding()]
param(

    [Parameter(Mandatory)]
    [ValidateSet('AzureCloud','AzureUSGovernment')]
    [string]$AzureEnvironment,

    [Parameter(Mandatory)]
    [string]$AzureTenantID
)

# Connect to Azure AD
Connect-AzAccount -Environment $AzureEnvironment -Tenant $AzureTenantID

# Register the 'Microsoft.AAD' provider to the subscription
Register-AzResourceProvider -ProviderNamespace 'Microsoft.AAD'

# Register the 'Azure AD Domain Services' enterprise application to the subscription if not already registered
New-AzADServicePrincipal -AppId "6ba9a5d4-8456-4118-b521-9c5ca10cdf84"

# Register the 'Domain Controller Services' service principal to the subscription if not already registered
New-AzADServicePrincipal -AppId "2565bd9d-da50-47d4-8b85-4c97f669dc36"
