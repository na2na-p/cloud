$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition

& $script_dir\drivers.ps1
& $script_dir\init.ps1

winget install -e --id OBSProject.OBSStudio
winget install -e --id Valve.Steam
winget install -e --id EpicGames.EpicGamesLauncher
winget install -e --id Nvidia.Broadcast
winget install -e --id PlayStation.DualSenseFWUpdater