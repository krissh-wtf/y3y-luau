--!optimize 2
--!strict

--[[
y3y-lua
Copyright (c) 2025 krissh-wtf (@acornese on Roblox). All Rights Reserved.
Originally implemented by @twilight-sparkle-irl on Github in Javascript, source: https://synthetic.garden/3y3.htm

To understand how this works, read the README
--]]

local y3y = {}

local byte = string.byte
local concat = table.concat
local char = utf8.char
local codes = utf8.codes

-- encode content to y3y
function y3y.encode(content: string): string
  local encoded = {}
  for i = 1, #content do
    local code = byte(content, i)
    encoded[i] = char(code + ((code > 0x00 and code < 0x7f) and 0xe0000 or 0))
  end
  return concat(encoded)
end

-- decode y3y content, assumes it is encoded 
function y3y.decode(content: string): string
  local decoded = {}
  for _, code in codes(content) do
    decoded[#decoded + 1] = char(code - (code > 0xe0000 and code < 0xe007f and 0xe0000 or 0))
  end
  return concat(decoded)
end

-- function to detect if content uses y3y or not
function y3y.detect(content: string): boolean
  for _, code in codes(content) do
    if code > 0xe0000 and code < 0xe007f then
      return true
    end
  end
  return false
end

-- extra function to tell if your content contains characters outside of the ASCII printable characters
-- see: https://www.ascii-code.com/, the "ASCII printable characters" section for available characters
function y3y.warn(content: string): boolean
  for _, code in codes(content) do
    if code > 127 then
      return true
    end
  end
  return false
end

return y3y