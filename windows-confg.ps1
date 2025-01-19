# Block zum Installieren von Software

# Check if the script is running with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges. Please approve the elevation prompt." -ForegroundColor Yellow
    # Relaunch the script with elevated privileges
    Start-Process powershell -ArgumentList ("-File `"$($MyInvocation.MyCommand.Path)`"") -Verb RunAs
    exit
}

# Administrator privileges are confirmed at this point
Write-Host "Installing applications with administrator privileges and dependencies..." -ForegroundColor Green

# Define a list of applications to install with their package identifiers
$appList = @(
    "VideoLAN.VLC",                 # VLC Media Player
    "Valve.Steam",                  # Steam
    "7zip.7zip",                    # 7zip
    "Microsoft.Office",             # Microsoft 365 (Office)
    "Obsidian.Obsidian",            # Obsidian
    "Outline.Outline",              # Outline
    "Anki.Anki",                    # Anki
    "Mozilla.Firefox",              # Firefox
    "Google.Chrome",                # Google Chrome
    "Google.Drive",                 # Google Drive
    "KeePassXC.KeePassXC",          # KeePassXC
    "Microsoft.MinecraftLauncher",  # Minecraft Client
    "Mozilla.Thunderbird"           # Thunderbird
)

# Loop through the list and install each application including dependencies
foreach ($app in $appList) {
    Write-Host "Installing $app and its dependencies..."
    winget install --id $app --silent --accept-source-agreements --accept-package-agreements
    if ($?) {
        Write-Host "$app installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Failed to install $app" -ForegroundColor Red
    }
}

Write-Host "All applications and their dependencies have been installed!"
