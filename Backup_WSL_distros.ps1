# Backup WSL distros

[CmdletBinding()]

$BackupDirectory = "C:\your\backup\path"

# Frist check if network drive is available
if (!(Test-Path $BackupDirectory)) {
  Write-Host "Dir not accessibly! Is the drive connected?"
  return
}

# Get list of WSL distros
$distros = wsl --list --quiet

Write-Host "WSL dristos found: $distros"
$confirmation = Read-Host "This will create a backup of each WSL distro and will take some time. Continue? "

if ($confirmation -eq 'y') {
  # Backup each distro
  foreach ($distro in $distros) {
    wsl --export $distro "$BackupDirectory\$distro.tar"
  }
}