--[[--
 Use this file to specify **System** preferences.
 Review [examples](+C:\Users\Lyra\my_tools\ZeroBraneStudio\cfg\user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--


-- allgemein
editor.tabwidth = 1
editor.fold = false
editor.fontname = "Picotron"
editor.fontsize = 16


-- keybindings

-- menu-keybindings
keymap[ID.EXIT] = "Ctrl-Shift-Q"
keymap[ID.CLOSE] = "Ctrl-Q"
keymap[ID.GOTODEFINITION] = "Ctrl-D"

-- editor-keybindings
editor.keymap[#editor.keymap + 1] = {('W'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_HOME}
editor.keymap[#editor.keymap + 1] = {('E'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_LINEEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTSTART}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARAUP}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARADOWN}



-- style-attributes

-- Pico-8-colors
local colors = {}
colors["black"] = {rgb = { 0, 0, 0 }, hex = '000000'}
colors["darkBlue"] = {rgb = { 28, 43, 83 }, hex = '1D2B53'}
colors["darkPurple"] = {rgb = { 126, 37, 83 }, hex = '7E2553'}
colors["darkGreen"] = {rgb = { 0, 135, 81 }, hex = '008751'}
colors["darkBrown"] = {rgb = { 171, 82, 54 }, hex = 'AB5236'}
colors["darkGrey"] = {rgb = { 95, 87, 79 }, hex = '5F574F'}
colors["lightGrey"] = {rgb = { 194, 195, 199 }, hex = 'C2C3C7'}
colors["white"] = {rgb = { 255, 241, 232 }, hex = 'FFF1E8'}
colors["red"] = {rgb = { 255, 0, 77 }, hex = 'FF004D'}
colors["orange"] = {rgb = { 255, 163, 0 }, hex = 'FFA300'}
colors["yellow"] = {rgb = { 255, 236, 39 }, hex = 'FFEC27'}
colors["lightGreen"] = {rgb = { 0, 228, 54 }, hex = '00E436'}
colors["lightBlue"] = {rgb = { 41, 173, 255 }, hex = '29ADFF'}
colors["lightPurple"] = {rgb = { 131, 118, 156 }, hex = '83769C'}
colors["pink"] = {rgb = { 255, 119, 168 }, hex = 'FF77A8'}
colors["lightBrown"] = {rgb = { 255, 204, 170 }, hex = 'FFCCAA'}

-- Pico-8-scheme
Pico8 = {
 Background  = colors["darkBlue"].rgb,
 CurrentLine = colors["darkBlue"].rgb,
 Selection   = colors["yellow"].rgb,
 Foreground  = colors["white"].rgb,
 Comment     = colors["lightPurple"].rgb,
 Red         = colors["red"].rgb,
 Orange      = colors["orange"].rgb,
 Yellow      = colors["yellow"].rgb,
 Green       = colors["lightGreen"].rgb,
 Aqua        = colors["lightBlue"].rgb,
 Blue        = colors["darkBlue"].rgb,
 Purple      = colors["darkPurple"].rgb,
}

--[[--
favourite standard color-themes:
- TomorrowNightBlue
- SolarizedDark
- NotepadPlusPlus
- SciTeLuaIDE
]]--
styles = loadfile('cfg/tomorrow.lua')('TomorrowNightBlue')
stylesoutshell = styles -- apply the same scheme to Output/Console windows
styles.auxwindow = styles.text -- apply text colors to auxiliary windows
styles.calltip = styles.text -- apply text colors to tooltips
