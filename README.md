# 👁 y3y-luau 👁
Hide text in plain sight, using invisible characters! now in Luau

## How?
To understand how y3y hides text you must understand how UTF-8 works. Watch this [simple video explanation](https://youtu.be/ut74oHojxqo?si=bo45JkjjBhW1vAgs) on UTF-8 to understand this next part

The first 128 (0 to 127) UTF-8 characters match the 128 ASCII characters making them each 1 byte long compared to all other proceeding characters (2 to 4 bytes). This means we can shift the code points of each character into one of the [Unicode Private Use Areas (PUA)](https://en.wikipedia.org/wiki/Private_Use_Areas) which are left unused by the Unicode committee to let third parties assign custom characters without breaking existing characters. Since practically no one really "adds" custom characters (with the notable exception of [Nerd Fonts](https://www.nerdfonts.com/) and other fonts) they appear invisible for everyone. An example of this is a [Vencord](https://vencord.dev) plugin for Discord named [FakeProfileThemes](https://vencord.dev/plugins/FakeProfileThemes) which allows you to change the colors in your Discord profile without nitro by adding the HEX value of the color encoded in y3y in your bio.

## Does this work on Roblox?
Yes and no. This started out as a PoC to show how it could be exploited, but I later found out it actually doesn’t work on the regular Roblox client, only in Roblox Studio. On top of that, it doesn’t seem to work on mobile or in Sober either. If you try putting it in chat, it gets completely tagged. The only place it really works is in textboxes, where it doesn’t get filtered. So if you’re using the native desktop client, the test place works fine:w. Just don’t expect it to work on Sober or mobile.

## Test it yourself
You can play the [test place](https://www.roblox.com/games/71373136937343/y3y-luau) which has a simple gui to encode and decode y3y, it is uncopylocked.
Your results may vary as to if the text is actually invisible as for me it only worked on Studio and on the official Windows client.

## Usage
```lua
local phrase: string = "ikiab ts pmo ngl"

local encodedPhrase: string = y3y.encode(phrase)
local decodedPhrase: string = y3y.decode(encodedPhrase)

print(encodedPhrase) -- output: `󠁩󠁫󠁩󠁡󠁢󠀠󠁴󠁳󠀠󠁰󠁭󠁯󠀠󠁮󠁧󠁬`
print(decodedPhrase) -- output: `ikiab ts pmo ngl`
```

# Credit
Original implementation by [@twilight-sparkle-irl](https://github.com/twilight-sparkle-irl) in Javascript, source: [https://synthetic.garden/3y3.htm](https://synthetic.garden/3y3.htm).