local gears = require "gears"

local opts = {
    modkey = "Mod4",
    terminal = "x-terminal-emulator",
    editor = os.getenv("EDITOR") or "editor",
    theme = gears.filesystem.get_themes_dir() .. "default/theme.lua"
}

opts.editor_cmd = opts.terminal .. " -e " .. opts.editor

return opts