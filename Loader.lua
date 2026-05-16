local success, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/Abyssal-lol/Orbit.cc/refs/heads/main/Loader/Main.lua")
end)

if success and result and not result:find("404") then
    loadstring(result)()
else
    warn("Failed to load script (404 or request failed)")
   ---http404 function is not added cuz it will kick people!
end
