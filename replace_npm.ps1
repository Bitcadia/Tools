# Define the peer files in the script's directory ($PSScriptRoot)
$peerFiles = @{
    "npm"  = @("npm.cmd")
    "pnpm" = @("pnpm.cmd", "pnpm.ps1")
    "npx"  = @("npx.cmd")
    "pnpx" = @("pnpx.cmd", "pnpx.ps1")
}

# Function to find a command using 'where' in CMD, skipping current directory
function Get-CommandPath($command) {
    try {
        $result = cmd /c where $command 2>$null
        if ($LASTEXITCODE -eq 0 -and $result) {
            $filteredResults = $result | Where-Object { (Resolve-Path $_).Path -ne (Resolve-Path (Join-Path $PSScriptRoot $command)).Path }
            if ($filteredResults.Count -ge 1) {
                return $filteredResults | Select-Object -First 1
            }
        }
        return $null
    } catch {
        return $null
    }
}

# Process each command type
foreach ($cmd in $peerFiles.Keys) {
    $cmdFiles = $peerFiles[$cmd]
    foreach ($fileName in $cmdFiles) {
        $peerPath = Join-Path $PSScriptRoot $fileName
        $installedPath = Get-CommandPath $fileName

        if ($installedPath) {
            $ext = [System.IO.Path]::GetExtension($fileName)
            $realName = if ($cmd -eq "npm" -or $cmd -eq "pnpm") { "${cmd}real$ext" } else { $null }
            $realPath = if ($realName) { Join-Path (Split-Path $installedPath) $realName } else { $null }

            # Check if the file is already a symlink
            $link = Get-Item $installedPath
            if ($link.LinkType -eq "SymbolicLink") {
                Write-Host "Setup already complete for $fileName at $installedPath"
                continue
            }

            # Check for npm and pnpm real versions
            if ($realName -and (Test-Path $realPath)) {
                Remove-Item $realPath -Force
                Write-Host "Deleted $realPath because $fileName is not a symlink. Please run the script again."
                continue
            } elseif ($cmd -eq "npm" -or $cmd -eq "pnpm") {
                # Move the original to "real" if no real version exists
                Move-Item $installedPath $realPath -Force
                Write-Host "Moved $installedPath to $realPath"
            }

            # Create the symlink if peer file exists
            if (Test-Path $peerPath) {
                New-Item -ItemType SymbolicLink -Path $installedPath -Target $peerPath -Force
                Write-Host "Created symlink for $fileName at $installedPath"
            } else {
                Write-Host "Peer file not found at $peerPath"
            }
        } else {
            Write-Host "Installed $fileName not found in PATH"
        }
    }
}
