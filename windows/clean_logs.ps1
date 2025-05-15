# clean_logs.ps1
. "$PSScriptRoot\utils.ps1"

$pathsToClean = @("$env:TEMP", "$env:WINDIR\Temp")

foreach ($path in $pathsToClean) {
    if (Test-Path $path) {
        Write-Log "Cleaning files in $path"
        try {
            Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction Stop
            Write-Log "Successfully cleaned $path"
        } catch {
            Write-Log "Failed to clean $path: $_" -Level "ERROR"
        }
    } else {
        Write-Log "Path not found: $path" -Level "WARNING"
    }
}

