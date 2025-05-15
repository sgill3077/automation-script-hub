# patch_system.ps1
. "$PSScriptRoot\utils.ps1"

Write-Log "Starting system patch process."

try {
    # Install PSWindowsUpdate module if needed
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Write-Log "PSWindowsUpdate module not found. Installing..."
        Install-Module PSWindowsUpdate -Force -Scope CurrentUser -ErrorAction Stop
    }
    Import-Module PSWindowsUpdate

    Write-Log "Checking for updates..."
    $updates = Get-WindowsUpdate -AcceptAll -Install -AutoReboot -ErrorAction Stop

    Write-Log "Update process completed successfully."
} catch {
    Write-Log "Failed during patching: $_" -Level "ERROR"
    exit 1
}

