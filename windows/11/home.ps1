$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition

& $script_dir\parts\drivers.ps1
& $script_dir\parts\init.ps1

winget install -e --id OBSProject.OBSStudio
winget install -e --id Valve.Steam
winget install -e --id EpicGames.EpicGamesLauncher
winget install -e --id Nvidia.Broadcast
winget install -e --id PlayStation.DualSenseFWUpdater
winget install -e --id LINE.LINE
winget install -e --id BlenderFoundation.Blender
winget install -e --id UnityTechnologies.UnityHub
