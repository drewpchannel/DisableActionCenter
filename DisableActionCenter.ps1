# Define the registry path and value name
$registryPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$valueName = "DisableNotificationCenter"

# Check if the registry key exists
if (-not (Test-Path $registryPath)) {
    # Create the registry key if it doesn't exist
    New-Item -Path $registryPath -Force | Out-Null
}

# Check if the DWORD value exists
$dwordExists = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if (-not $dwordExists) {
    # Create the DWORD value and set it to 1 if it doesn't exist
    New-ItemProperty -Path $registryPath -Name $valueName -Value 1 -PropertyType DWORD -Force | Out-Null
}