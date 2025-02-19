# PowerShell script to download and install Hack Nerd Font with cache refresh

# Define variables
$downloadUrl = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
$tempDir = "$env:TEMP\HackNerdFont"
$zipFile = "$tempDir\Hack.zip"
$fontDir = "$env:windir\Fonts"
$shell = New-Object -ComObject Shell.Application

# Create temp directory
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

# Download the font
Write-Host "Downloading Hack Nerd Font..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile

# Extract the zip file
Write-Host "Extracting font files..."
Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force
explorer.exe $tempDir