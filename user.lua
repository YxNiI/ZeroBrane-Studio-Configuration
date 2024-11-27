--[[--
 Use this file to specify **System** preferences.
 Review [examples](+C:\Users\Lyra\my_tools\ZeroBraneStudio\cfg\user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--


-- allgemein
editor.tabwidth = 1
editor.fold = false
editor.fontname = "Picotron"
editor.fontsize = 16


--keybindings

--menu-keybindings
keymap[ID.EXIT] = "Ctrl-Shift-Q"
keymap[ID.CLOSE] = "Ctrl-Q"

--editor-keybindings
editor.keymap[#editor.keymap + 1] = {('W'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_HOME}
editor.keymap[#editor.keymap + 1] = {('E'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_LINEEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTSTART}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARAUP}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARADOWN}
