-- Kit Pastebin Updater/Installer
-- Copyright AxTo Inc. Released under the MIT License.
-- Made for ComputerCraft 1.7 and above.

term.clear()
term.setCursorPos(1,1)
local advanced = term.isColor()
if advanced then
  term.setTextColor(colors.orange)
end
print("Kit Updater/Installer")
if advanced then
  term.setTextColor(colors.white)
end
getfile = http.get("https://raw.github.com/AxTo/Kit/master/dist/kit.lua")
if getfile == false then
  print("[!] Could not get latest Kit build from GitHub.")
end
print("[*] Downloaded latest Kit build from GitHub.")
file = fs.open("kit", "w")
  file.write(getfile.readAll())
file.close()
print("[*] Saved contents to file.")
print("[*] Done installing Kit! Check http://git.io/kitdocs for Documentation on Kit.")
