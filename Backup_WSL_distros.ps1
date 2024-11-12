# Backup WSL distros

[CmdletBinding()]

$BackupDirectory = "C:\your\backup/path"

# Frist check if network drive is available
if (Test-Path $BackupDirectory) {
  
    # Get list of WSL distros
    $distros = wsl --list --quiet

    Write-Host "WSL dristos found: $distros"
    $confirmation = Read-Host "This will create a backup of each WSL distro and will take some time. Continue? y/n"

    if ($confirmation -eq 'y') {
        # Backup each distro
        foreach ($distro in $distros) {
            wsl --export $distro "$BackupDirectory\$distro.tar"
        }
    }
} else {
    Write-Host "Dir $BackupDirectory not accessable! Is the drive connected?"
    return
}
