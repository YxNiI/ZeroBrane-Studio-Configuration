-- This is a file that sets color scheme based on Tomorrow format.
-- Copyright 2011-14 Paul Kulchenko, ZeroBrane LLC

--[[--
1. this file was copied from the [ZeroBrane-Studio source-code](https://github.com/pkulchenko/ZeroBraneStudio/tree/master), by [YxNill](https://github.com/)
2. the [Pico-8-theme](https://www.lexaloffle.com/pico-8.php) was implemented here by [YxNill](https://github.com/), which is only the [Pico-8-table](https://www.lexaloffle.com/pico-8.php) inside the colors-table
3. the color-palette and the design for the theme were completely inspired by [Pico-8](https://www.lexaloffle.com/pico-8.php)
--]]--

local theme = ...

local function h2d(n) return 0+('0x'..n) end
local function H(c, bg) c = c:gsub('#','')
 -- since alpha is not implemented, convert RGBA to RGB
 -- assuming 0 is transparent and 255 is opaque
 -- based on http://stackoverflow.com/a/2645218/1442917
 local bg = bg and H(bg) or {255, 255, 255}
 local a = #c > 6 and h2d(c:sub(7,8))/255 or 1
 local r, g, b = h2d(c:sub(1,2)), h2d(c:sub(3,4)), h2d(c:sub(5,6))
 return {
  math.min(255, math.floor((1-a)*bg[1]+a*r)),
  math.min(255, math.floor((1-a)*bg[2]+a*g)),
  math.min(255, math.floor((1-a)*bg[3]+a*b))}
end

-- Pico-8-colors
local pico8Colors = {}
pico8Colors["black"] = {rgb = { 0, 0, 0 }, hex = '000000'}
pico8Colors["darkBlue"] = {rgb = { 28, 43, 83 }, hex = '1D2B53'}
pico8Colors["darkPurple"] = {rgb = { 126, 37, 83 }, hex = '7E2553'}
pico8Colors["darkGreen"] = {rgb = { 0, 135, 81 }, hex = '008751'}
pico8Colors["darkBrown"] = {rgb = { 171, 82, 54 }, hex = 'AB5236'}
pico8Colors["darkGrey"] = {rgb = { 95, 87, 79 }, hex = '5F574F'}
pico8Colors["lightGrey"] = {rgb = { 194, 195, 199 }, hex = 'C2C3C7'}
pico8Colors["white"] = {rgb = { 255, 241, 232 }, hex = 'FFF1E8'}
pico8Colors["red"] = {rgb = { 255, 0, 77 }, hex = 'FF004D'}
pico8Colors["orange"] = {rgb = { 255, 163, 0 }, hex = 'FFA300'}
pico8Colors["yellow"] = {rgb = { 255, 236, 39 }, hex = 'FFEC27'}
pico8Colors["lightGreen"] = {rgb = { 0, 228, 54 }, hex = '00E436'}
pico8Colors["lightBlue"] = {rgb = { 41, 173, 255 }, hex = '29ADFF'}
pico8Colors["lightPurple"] = {rgb = { 131, 118, 156 }, hex = '83769C'}
pico8Colors["pink"] = {rgb = { 255, 119, 168 }, hex = 'FF77A8'}
pico8Colors["lightBrown"] = {rgb = { 255, 204, 170 }, hex = 'FFCCAA'}

local colors = {
 Pico8 = {
  Background  = pico8Colors["darkBlue"].rgb,
  CurrentLine = pico8Colors["darkBlue"].rgb,
  Selection   = pico8Colors["yellow"].rgb,
  Foreground  = pico8Colors["white"].rgb,
  Comment     = pico8Colors["lightPurple"].rgb,
  Red         = pico8Colors["lightBlue"].rgb,
  Orange      = pico8Colors["red"].rgb,
  Yellow      = pico8Colors["yellow"].rgb,
  Green       = pico8Colors["lightGreen"].rgb,
  Aqua        = pico8Colors["orange"].rgb,
  Blue        = pico8Colors["pink"].rgb,
  Purple      = pico8Colors["lightBrown"].rgb,
 } 
}

-- add more of the specified color (keeping all in 0-255 range)
local mixer = function(c, n, more)
 if not c or #c == 0 then return c end
 local c = {c[1], c[2], c[3]} -- create a copy, so it can be modified
 c[n] = c[n] + more
 local excess = c[n] - 255
 if excess > 0 then
  for clr = 1, 3 do
   c[clr] = n == clr and 255 or c[clr] > excess and c[clr] - excess or 0
  end
 end
 return c
end

local C = colors[theme] or colors.Tomorrow
return {
 -- wxstc.wxSTC_LUA_DEFAULT
 lexerdef = {fg = C.Foreground},
 -- wxstc.wxSTC_LUA_COMMENT, wxstc.wxSTC_LUA_COMMENTLINE, wxstc.wxSTC_LUA_COMMENTDOC
 comment = {fg = C.Comment, fill = true},
 -- wxstc.wxSTC_LUA_STRING, wxstc.wxSTC_LUA_CHARACTER, wxstc.wxSTC_LUA_LITERALSTRING
 stringtxt = {fg = C.Green},
 -- wxstc.wxSTC_LUA_STRINGEOL
 stringeol = {fg = C.Green, fill = true},
 -- wxstc.wxSTC_LUA_PREPROCESSOR
 preprocessor = {fg = C.Orange},
 -- wxstc.wxSTC_LUA_OPERATOR
 operator = {fg = C.Aqua},
 -- wxstc.wxSTC_LUA_NUMBER
 number = {fg = C.Red},

 -- wxstc.wxSTC_LUA_WORD, wxstc.wxSTC_LUA_WORD2-8
 keywords0 = {fg = C.Blue, b = true},
 keywords1 = {fg = C.Aqua, b = false},
 keywords2 = {fg = C.Aqua, b = true},
 keywords3 = {fg = C.Purple, b = false},
 keywords4 = {fg = C.Purple, b = false},
 keywords5 = {fg = C.Purple, b = false},
 keywords6 = {fg = C.Purple, b = false},
 keywords7 = {fg = C.Purple, b = false},

 -- common (inherit fg/bg from text)
 -- wxstc.wxSTC_LUA_IDENTIFIER
 text = {fg = C.Foreground, bg = C.Background},
 linenumber = {fg = C.Comment},
 bracematch = {fg = C.Orange, b = true},
 bracemiss = {fg = C.Red, b = true},
 ctrlchar = {fg = C.Yellow},
 indent = {fg = C.Comment},
 calltip = {fg = C.Foreground, bg = C.Background},

 -- common special (need custom fg & bg)
 sel = {bg = C.Selection},
 caret = {fg = C.Foreground},
 caretlinebg = {bg = C.CurrentLine},
 fold = {fg = C.Comment, bg = C.Background, sel = mixer(C.Comment, 1, 96)},
 whitespace = {fg = C.Comment},
 edge = {},

 indicator = {
  fncall = {fg = C.Purple, st = wxstc.wxSTC_INDIC_HIDDEN},
  --[[ other possible values are:
      wxSTC_INDIC_PLAIN	 Single-line underline
      wxSTC_INDIC_SQUIGGLE Squiggly underline
      wxSTC_INDIC_TT	 Line of small T-shapes
      wxSTC_INDIC_DIAGONAL Diagonal hatching
      wxSTC_INDIC_STRIKE	 Strike-out
      wxSTC_INDIC_BOX      Box
      wxSTC_INDIC_ROUNDBOX Rounded Box
    --]]
  -- these indicators have all different default styles
  varlocal = {fg = C.Foreground},
  varglobal = {fg = C.Foreground},
  varmasked = {fg = C.Foreground},
  varmasking = {fg = C.Foreground},
 },

 -- markup
 ['['] = {hs = mixer(mixer(C.Comment, 1, 64), 3, 128)},
 ['|'] = {fg = mixer(mixer(C.Comment, 1, 64), 3, 64)},

 -- markers
 marker = {
  message = {bg = C.Selection},
  output = {bg = C.CurrentLine},
  prompt = {fg = C.Foreground, bg = C.Background},
  error = {bg = mixer(C.Background, 1, 32)},
 },
}

--[[

---- Solarized license ----

Copyright (c) 2011 Ethan Schoonover

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]
