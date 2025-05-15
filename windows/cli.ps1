# cli.ps1
. "$PSScriptRoot\utils.ps1"

function Show-Menu {
    Clear-Host
    Write-Host "=== Automation Script Hub - Windows Edition ==="
    Write-Host "1) Patch System"
    Write-Host "2) Restart Services"
    Write-Host "3) Clean Logs"
    Write-Host "4) Exit"
}

do {
    Show-Menu
    $choice = Read-Host "Select an option"

    switch ($choice) {
        '1' { . "$PSScriptRoot\patch_system.ps1" }
        '2' { . "$PSScriptRoot\restart_services.ps1" }
        '3' { . "$PSScriptRoot\clean_logs.ps1" }
        '4' { Write-Log "Exiting Automation Hub"; break }
        default { Write-Host "Invalid choice, please try again." }
    }
    Write-Host "`nPress any key to return to menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} while ($true)

