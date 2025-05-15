# utils.ps1

# Ensure logs directory exists
$logDir = Join-Path -Path $PSScriptRoot -ChildPath "logs"
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

$logFile = Join-Path -Path $logDir -ChildPath "activity.log"

function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp][$Level] $Message"
    Write-Output $logMessage
    Add-Content -Path $logFile -Value $logMessage
}

function Check-Error {
    param([int]$LastExitCode)

    if ($LastExitCode -ne 0) {
        Write-Log -Message "Error encountered with exit code $LastExitCode" -Level "ERROR"
        throw "Execution halted due to error."
    }
}

