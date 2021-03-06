--[[Kristium browser client]]--

-- require("node.lua") -- ??

local node = "https://kristium.ale32bit.me/"
local version = 1.0

local sandbox = {
	term = term,
	math = math,
	assert = assert,
	bit = bit,
	bit32 = bit32,
	colors = colors,
	colours = colours,
	http = http,
	ipairs = ipairs,
	pairs = pairs,
	json = json,
	keys = keys,
	next = next,
	paintutils = paintutils, -- unsafe
	pcall = pcall,
	xpcall = xpcall,
	print = print,
	printError = printError,
	read = read,
	sleep = sleep,
	table = table,
	textutils = textutils,
	type = type,
	unpack = unpack,
	vector = vector,
	write = write,
	string = string,
	tostring = tostring,
	tonumber = tonumber,
}

sandbox.browser = {
  w,h = t and t.getSize() or term.getSize(),
  --[[Core functions]]
  sp = function(x,y,t) return t and t.setCursorPos(x,y) or term.setCursorPos(x,y) end,
  fc = function(col,t) return t and t.setTextColour(col) or term.setTextColour(col) end,
  bc = function(col,t) return t and t.setBackgroundColour(col) or term.setBackgroundColour(col) end,
  write = function(str,t) return t and t.write(str) or term.write(str) end,
  center = function(str,y,t)
    local w,h = t and t.getSize() or term.getSize()
    sandbox.browser.sp(math.floor(w/2-(#str/2)),y,t)
    sandbox.browser.write(str)
  end,
  fill = function(x,y,w,h,c)
	for yt=y,h do
		for xt=x,w do
			sandbox.browser.sp(xt,yt)
			sandbox.browser.write(c)
		end
	end
  end,
  --[[Drawing functions]]
  update = function()
    --[[Draw top]]
	sandbox.browser.fc(colours.black)
	sandbox.browser.bc(colours.white)
	sandbox.browser.fill(1,1,w,1," ")
	
  end,
  --[[Network functions]]
  get = function(url)
	end,
	useragent = "Kristium "..version.." (".._HOST..")",
}

sandbox.browser.center("test",5)















