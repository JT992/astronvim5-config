--- banners:

local BANNER_ASTRONVIM = {
  " █████  ███████ ████████ ██████   ██████ ",
  "██   ██ ██         ██    ██   ██ ██    ██",
  "███████ ███████    ██    ██████  ██    ██",
  "██   ██      ██    ██    ██   ██ ██    ██",
  "██   ██ ███████    ██    ██   ██  ██████ ",
  "",
  "███    ██ ██    ██ ██ ███    ███",
  "████   ██ ██    ██ ██ ████  ████",
  "██ ██  ██ ██    ██ ██ ██ ████ ██",
  "██  ██ ██  ██  ██  ██ ██  ██  ██",
  "██   ████   ████   ██ ██      ██",
}

local BANNER_INFINITE_GAMING = {
  "██ ███    ██ ███████ ██ ███    ██ ██ ████████ ███████",
  "██ ████   ██ ██      ██ ████   ██ ██    ██    ██     ",
  "██ ██ ██  ██ ███████ ██ ██ ██  ██ ██    ██    ███████",
  "██ ██  ██ ██ ██      ██ ██  ██ ██ ██    ██    ██     ",
  "██ ██   ████ ██      ██ ██   ████ ██    ██    ███████",
  "",
  "███████  █████  ███    ███ ██ ███    ██ ███████",
  "██      ██   ██ ████  ████ ██ ████   ██ ██     ",
  "██  ███ ███████ ██ ████ ██ ██ ██ ██  ██ ██  ███",
  "██   ██ ██   ██ ██  ██  ██ ██ ██  ██ ██ ██   ██",
  "███████ ██   ██ ██      ██ ██ ██   ████ ███████",
}

--- set your banner here:
local HEADER = BANNER_INFINITE_GAMING

table.insert(HEADER, "\n")

--- NOTE: if not using splashes you should comment out this section

-- must determine absolute file path, can use this file to do that
local SPLASHES_PATH = string.gsub(debug.getinfo(1).source, "snacks.lua", "splashes.txt")
SPLASHES_PATH = string.gsub(SPLASHES_PATH, "@", "")

local SPLASHES = {}
for line in io.lines(SPLASHES_PATH) do
  local formatted = string.gsub(line, "\\n", "\n")
  table.insert(SPLASHES, formatted)
end

--- this will set a random splash on load
math.randomseed(os.time())
local SPLASH = SPLASHES[math.random(#SPLASHES)]

--- or comment that out and set the splash here (good for checking formatting)
-- local SPLASH = SPLASHES[#SPLASHES]

table.insert(HEADER, SPLASH)

--- NOTE: that's it you can stop commenting out now.

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat(HEADER, "\n"),
        },
      },
    },
  },
}
