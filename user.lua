--[[--
[YxNill's](https://github.com/YxNiI) configuration-file for [ZeroBrane Studio](https://studio.zerobrane.com/)
--]]--


-- [editor-preferences](https://studio.zerobrane.com/doc-editor-preferences)
editor.tabwidth = 1
editor.fold = false
editor.fontname = "Picotron"
editor.fontsize = 16


-- keybindings

-- [menu-keybindings](https://github.com/pkulchenko/ZeroBraneStudio/blob/master/src/editor/keymap.lua)
keymap[ID.EXIT] = "Ctrl-Shift-Q"          -- shutdown-IDE
keymap[ID.CLOSE] = "Ctrl-Q"               -- close tab
keymap[ID.GOTODEFINITION] = "Ctrl-J"      -- go to definition
keymap[ID.VIEWFILETREE] = "Alt-1"         -- open file-explorer
keymap[ID.VIEWOUTPUT] = "Alt-4"           -- open runtime-console-view
keymap[ID.VIEWCALLSTACK] = "Alt-5"        -- open callstack
keymap[ID.AUTOCOMPLETE] = "Ctrl-SPACE"    -- open suggestions for autocompletion


-- [editor-keybindings](https://studio.zerobrane.com/doc-editor-keyboard-shortcuts)

--[[--
documentation for changing the bindings:
- [how-to](https://studio.zerobrane.com/doc-editor-preferences#keyboard-shortcuts)
- [special codes](https://www.scintilla.org/ScintillaDoc.html#KeyBindings)
- [commands](https://www.scintilla.org/ScintillaDoc.html#KeyboardCommands)

Ctrl-W    -> move cursor to the start of the line
Ctrl-E    -> move cursor to the end of the line
Ctrl-Up   -> move cursor to file-top
Ctrl-Down -> move cursor to file-top
Alt-Up    -> move cursor to last paragraph
Alt-Down  -> move cursor to next paragraph
--]]--
editor.keymap[#editor.keymap + 1] = {('W'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_HOME}
editor.keymap[#editor.keymap + 1] = {('E'):byte(), wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_LINEEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTSTART}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_CTRL, wxstc.wxSTC_CMD_DOCUMENTEND}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_UP, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARAUP}
editor.keymap[#editor.keymap + 1] = {wxstc.wxSTC_KEY_DOWN, wxstc.wxSTC_SCMOD_ALT, wxstc.wxSTC_CMD_PARADOWN}


-- colors

--[[--
favourite standard color-themes:
- TomorrowNightBlue
- SolarizedDark
- NotepadPlusPlus
- SciTeLuaIDE
--]]--
styles = loadfile('cfg/my_pico-8-theme.lua')('Pico8')
stylesoutshell = styles -- apply the same scheme to Output/Console windows
styles.auxwindow = styles.text -- apply text colors to auxiliary windows
styles.calltip = styles.text -- apply text colors to tooltips
