$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition

winget install -e --id Git.Git

& $script_dir\browser.ps1
& $script_dir\cloud.ps1

winget install -e --id GitHub.cli
winget install -e --id Microsoft.PowerToys
winget install -e --id JetBrains.Toolbox
winget install -e --id Mozilla.Thunderbird
winget install -e --id Figma.Figma
winget install -e --id SlackTechnologies.Slack
winget install -e --id Discord.Discord
winget install -e --id Microsoft.PowerShell
winget install -e --id Docker.DockerDesktop
winget install -e --id CrystalDewWorld.CrystalDiskInfo.KureiKeiEdition
winget install -e --id DeepL.DeepL
winget install Microsoft.WindowsTerminal
winget install Microsoft.VisualStudioCode
winget install DevToys

& $script_dir\nodejs_setup.ps1