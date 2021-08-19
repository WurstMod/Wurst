-- Here's a template:
local pogTemplate = {
    name = "MyPogModule", -- The name of the module which will display in the list
    id = "mypogmod", -- The unique module ID (WARNING: only one module can have an ID. If we find out that your module uses an ID that already exists, we'll change it)
    description = "This is a module, and it's very pog!!!", -- The text that appears when you hover over the module
    autoEnable = { "fly" }, -- Automatically enables all mods in this array (by ID)
    deathDisable = true, -- Disables the module once the character dies
    gameSpecific = 123456789, -- Optional | This module will only appear when in a specific game
    gameBonus = 123456789, -- Optional | This module's name will become yellow when in a specific game
    settings = createOptions({
        number = {
            type = "number",
            title = "Number",
            value = 1,
            min = -100,
            max = -100
        },
        string = {
            type = "string",
            title = "String",
            value = "Template",
        },
        checkbox = {
            type = "checkbox",
            title = "Checkbox",
            value = false
        },
        key = {
            type = "key",
            title = "Key",
            value = 0
        },
        choose = {
            type = "choose",
            title = "Choose",
            value = 1,
            options = {
                "Foo",
                "Bar",
            }
        }
    }),
    onEnable = function(mod)
        print("Enabled!")
        print(string.format("%s: %s", mod.settings.number.title, mod.settings.number.value))
        print(string.format("%s: %s", mod.settings.string.title, mod.settings.string.value))
        print(string.format("%s: %s", mod.settings.checkbox.title, mod.settings.number.value))
        print(string.format("%s: %s", mod.settings.key.title, mod.settings.key.value))
        print(string.format("%s: %s", mod.settings.choose.title, mod.settings.choose.options[mod.settings.choose.value]))
        mod:disable()
    end,
    onDisable = function (mod)
        print("Disabled!")
    end,
    tick = function (mod)
        -- Tick, runs every frame when mod is enabled
    end
}

-- Add your modules below:
-- Make sure to only add Community Modules. If you remove/edit other community modules, your Pull Request will automatically be declined.
-- NOTE: The autoEnable property can only enable built-in modules. If you add a community module in the autoEnable property, we'll remove it.

return {
--> LIST <--

--> LIST_END <--
}