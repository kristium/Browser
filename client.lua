--[[Kristium browser client]]--
local function sp(x,y,t) return t and t.setCursorPos(x,y) or term.setCursorPos(x,y) end
local function fc(col,t) return t and t.setTextColour(col) or term.setTextColour(col) end
local function bc(col,t) return t and t.setBackgroundColour(col) or term.setBackgroundColour(col) end

local function center(str,y,t)
  local w,h = t and t.getSize() or term.getSize()
  sp(math.floor(w/2-(#str/2)),y,t)
  if t then t.write(str) else term.write(str) end
end

local sandbox = {}
