-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

local opts = require "opts"
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

---@diagnostic disable-next-line: undefined-field
local awesome, root = _G.awesome, _G.root


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

beautiful.init(opts.theme)
root.keys(require "globalkeys")

menubar.utils.terminal = opts.terminal

awful.screen.connect_for_each_screen(function(s) require("screen") { screen = s } end)


-- -- {{{ Mouse bindings
-- root.buttons(gears.table.join(
--     awful.button({}, 3, function() mymainmenu:toggle() end),
--     awful.button({}, 4, awful.tag.viewnext),
--     awful.button({}, 5, awful.tag.viewprev)
-- ))