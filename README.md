# You are **_not_** allowed to use our work without crediting us.

<div align="center">
    <img src="https://raw.githubusercontent.com/WurstMod/Wurst/dev/wurstdev.png" />
</div>

---

WurstMod is a **mod** for Roblox, inspired by Wurst for Minecraft™

**Do you have any ideas/reports etc.? Contact us [here](https://github.com/WurstMod/Wurst/issues/new)**

# Loading the Script

```lua
loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/latest.lua"))
```

Most games have `loadstring()` **disabled**. If so, visit the URL and copy the script inside.  
Use the copied script instead of the `loadstring()` script

## Different Versions

<details>
  <summary>v1.6.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.6.0.lua"))
  ```
</details>

<details>
  <summary>v1.5.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.5.0.lua"))
  ```
</details>

<details>
  <summary>v1.4.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.4.0.lua"))
  ```
</details>

<details>
  <summary>v1.3.1 - Bugfix</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.3.1.lua"))
  ```
</details>

<details>
  <summary>v1.3.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.3.0.lua"))
  ```
</details>

<details>
  <summary>v1.2.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.2.0.lua"))
  ```
</details>

<details>
  <summary>v1.1.1 - Bugfix</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.1.1.lua"))
  ```
</details>

<details>
  <summary>v1.1.0</summary>
  
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.1.0.lua"))
  ```
</details>

<details>
  <summary>v1.0.0</summary>
    
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/v1.0.0.lua"))
  ```
</details>

# Themes

WurstMod now supports themes! Themes can be applied by adding a `?theme=X` parameter to the URL. Here's the list of all the themes:

- basic

Example:

```lua
loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/latest.lua?theme=basic"))
```

# Community Modules

WurstMod also supports community modules (which can be found in community-modules.lua), which allows people to add their own module! All of the community modules are automatically added to the script, once accepted.

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
  <summary>Modyfing the Script</summary>
  
  You can also add a `?key=X` parameter to the URL. We recommend viewing all [Enum.KeyCode](https://developer.roblox.com/en-us/api-reference/enum/KeyCode) values. Example:
    
  ```lua
  loadstring(game:HttpGet("https://www.wurst-mod.tk/dev/latest.lua?key=RightShift"))
  ```
</details>
