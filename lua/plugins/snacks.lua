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

-- FIXME: broken
local SPLASHES = {}
for line in io.lines "splashes.txt" do
  table.insert(SPLASHES, line)
end

--- this will set a random splash on load
math.randomseed(os.time())
local SPLASH = SPLASHES[math.random(#SPLASHES)]

--- or comment that out and set the splash here (good for checking formatting)
-- local SPLASH = SPLASHES[#SPLASHES]

table.insert(HEADER, SPLASH)

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
