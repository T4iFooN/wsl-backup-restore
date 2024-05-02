# Restore WSL distros

[CmdletBinding()]

$BackupDirectory = "C:\your\backup\path"

$confirmation = Read-Host "With this all WSL distibutions will be restored from the backup dir and overwritten! Really continue? "
if ($confirmation -eq 'y') {
    # Get list of backup files
    $backupFiles = Get-ChildItem $BackupDirectory

    # Restore each backup file
    foreach ($backupFile in $backupFiles) {
        $distro = $backupFile.BaseName -replace '.tar',''
        wsl --import $distro "$BackupDirectory\$backupFile"
    }
}