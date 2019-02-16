 -- KRISTIUM BROWSER


local node = "https://kristium.ale32bit.me/"
local version = "0.1"

local url = table.concat({...}, "%20") -- test

print("kristium engine prototype")
print("fetching "..url)

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
	get = function(url)
	
	end,
	useragent = "Kristium "..version.." (".._HOST..")",
}

local h = http.get(node..url)
local source = h.readAll()
h.close()

local page = load(source, "Kristium", "t", sandbox)
local ok, err = pcall(page)

if not ok then
	printError(err)
end
