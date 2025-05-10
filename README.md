# PatcheyedKat Hub for Natural Disaster Survival

A lightweight custom Roblox hub for Natural Disaster Survival

## Features

- **TPToAll**  
  Teleport yourself to every player in the game with one click.

- **Custom Ring V1**  
  Makes a ring around your player to fling people using unanchored parts

- **Infinite Yield**  
  Integrates the popular admin commands library for advanced control.

## Loadstring

```lua
-- If executor supports rconsole
if rconsoleprint then
    rconsoleprint("@@WHITE@@[PatcheyedKat Hub] ")
    rconsoleprint("@@YELLOW@@Loading V2...!\n")
else
    print("[PatcheyedKat Hub] Loading V2...")
end

wait(1)

-- Fetch and execute the hub
local url = "https://raw.githubusercontent.com/PatcheyedKat/PatcheyedKatNDSHub/refs/heads/main/PatcheyedKat_Hub_V2.lua"
local success, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if success then
    if rconsoleprint then
        rconsoleprint("@@WHITE@@[PatcheyedKat Hub] ")
        rconsoleprint("@@GREEN@@Loaded successfully!\n")
    else
        print("[PatcheyedKat Hub] Loaded successfully!")
    end
else
    if rconsoleprint then
        rconsoleprint("@@WHITE@@[PatcheyedKat Hub] ")
        rconsoleprint("@@RED@@Failed to load: "..err.."\n")
    else
        warn("[PatcheyedKat Hub] Failed to load:", err)
    end
end

