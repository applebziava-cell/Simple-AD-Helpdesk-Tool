<#
.SYNOPSIS
    Active Directory Helpdesk Assistant - Lite Version.
.DESCRIPTION
    Quickly check account status (Enabled/Locked) and details.
#>

Import-Module ActiveDirectory

# =========================================================================
# CONFIGURATION BLOCK - SET YOUR ENVIRONMENT DETAILS HERE
# =========================================================================
$DomainController = "your-domain-controller.local" 
# =========================================================================

Clear-Host
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "   ACTIVE DIRECTORY ASSISTANT (LITE)        " -ForegroundColor Cyan
Write-Host "   Target DC: $DomainController" -ForegroundColor Yellow
Write-Host "=============================================" -ForegroundColor Cyan

$username = Read-Host "Enter SamAccountName (Username)"
try {
    $user = Get-ADUser -Identity $username -Server $DomainController -Properties Enabled, LockedOut, PasswordLastSet
    Write-Host "`nUser Found:" -ForegroundColor Green
    Write-Host "Name: $($user.Name)"
    Write-Host "Enabled: $($user.Enabled)"
    Write-Host "LockedOut: $($user.LockedOut)"
    Write-Host "Password Last Set: $($user.PasswordLastSet)"
} catch {
    Write-Host "Error: User '$username' not found on $DomainController." -ForegroundColor Red
}
Write-Host "`n=============================================" -ForegroundColor Cyan
Write-Host "Get the Full Version with Password Reset & Account Unlock features on Gumroad!" -ForegroundColor Magentas
