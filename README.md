<div align="center">
    <img src="https://raw.githubusercontent.com/WurstMod/Wurst/main/wurst.png" />
</div>

----

WurstMod is a **mod** for Roblox, inspired by Wurst for Minecraft™

**Do you have any ideas/reports etc.? Contact us [here](https://github.com/WurstMod/Wurst/issues/new)**

# Loading the Script
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/WurstMod/Wurst/main/script.lua"))
```
## Different Versions
<details>
  <summary>v1.2.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/WurstMod/Wurst/888de07de19997016a74d0a5261717dd206247b1/script.lua"))
  ```
</details>

<details>
  <summary>v1.1.1 - Bugfix</summary>
  
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/WurstMod/Wurst/8960d22a5e608b2abdc2c5fe0ba017d3efd963a9/script.lua"))
  ```
</details>

<details>
  <summary>v1.1.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/WurstMod/Wurst/b0dc3976144fe7f578cb014a31838776ae3fc366/script.lua"))
  ```
</details>

<details>
  <summary>v1.0.0</summary>
    
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/WurstMod/Wurst/a85302b2332b8872f01d14d804f1d74a90b8e0a1/script.lua"))
  ```
</details>

# Controls
- RControl - toggle gui
#### Module
- LeftClick - toggle module
- RightClick - open settings menu
#### Module Settings
- RControl - close settings menu

# Can't use Right Control?
<details>
  <summary>AutoHotkey</summary>
  
  You can use programs like [AutoHotkey](https://www.autohotkey.com) or [AutoIt](https://www.autoitscript.com/site/), to rebind Right Control to a different key
</details>

<details>
  <summary>On-screen Keyboard</summary>
  
  You can also use an on-screen keyboard, which allows you to press keys just by clicking on them.
</details>

<details>
  <summary>Modify our script (kinda)</summary>
  
  You can also modify our script, to change the keybind.
  ```lua
  local script = game:HttpGet("YOUR_PREFFERED_URL")
  script = script:gsub("RightShift", "LeftShift")
  loadstring(script)
  ```
</details>
