irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin  "$HOME\.scoop"
[System.Environment]::SetEnvironmentVariable("Path",$env:Path+";$HOME\.scoop\shims")
$StartMarker = "# DEF from install-tools.sh"
$EndMarker = "# ENDEF from install-tools.sh"

if ((Get-Content $PROFILE) -contains $StartMarker -and (Get-Content $PROFILE) -contains $EndMarker) {
    $content = Get-Content $PROFILE 
    $inRange = $false
    $newContent = @()

    foreach ($line in $content) {
        if ($line -eq $EndMarker) {
            $inRange = $false
        }
        if (-not $inRange) {
            $newContent += $line
        }
        if ($line -eq $StartMarker) {
            $inRange = $true
        }
    }

    Set-Content -Path $PROFILE -Value $newContent
    Write-Host "Lines between '$StartMarker' and '$EndMarker' have been removed from $PROFILE."
} else {
    Write-Host "Could not find the start and end markers in $PROFILE. No changes made."
}
Add-Content -Path $PROFILE -Value "$StartMarker
[System.Environment]::SetEnvironmentVariable(`"Path`",`$env:Path+`";`$HOME\.scoop\shims`")
$EndMarker"

scoop bucket add extras
scoop install zig
scoop install neovim
scoop install fzf
scoop install ripgrep
scoop install make
scoop install lazygit
scoop install fd

New-Item -ItemType SymbolicLink -Path $HOME/AppData/Local/nvim -Target $PSScriptRoot/nvim
