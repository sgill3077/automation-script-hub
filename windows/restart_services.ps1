# restart_services.ps1
. "$PSScriptRoot\utils.ps1"

$servicesToCheck = @("Spooler", "wuauserv") # Customize with critical services

foreach ($serviceName in $servicesToCheck) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
    if ($null -ne $service) {
        if ($service.Status -ne "Running") {
            Write-Log "Service $serviceName is $($service.Status). Attempting restart."
            try {
                Restart-Service -Name $serviceName -Force -ErrorAction Stop
                Write-Log "Service $serviceName restarted successfully."
            } catch {
                Write-Log "Failed to restart service $serviceName: $_" -Level "ERROR"
            }
        } else {
            Write-Log "Service $serviceName is running normally."
        }
    } else {
        Write-Log "Service $serviceName not found." -Level "WARNING"
    }
}

