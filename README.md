# gamemodevoting
Allows the ability to vote for gamemodes without the need for fretta compatibility.


TO EDIT!!!

To edit timer: gamemodetimer.lua and edit the number that is greater than 0 in the code. NOTE* the number is in seconds.
To edit gamemodes/title: gamemodetimer.lua and edit the gamemodes and title in there, you can add as many gamemodes as you have. **NOTE** Make the name of the gamemode the same as the name of the folder that contains your gamemode

timer.Create("GMSwitch", 1200, 0, function()
	RunConsoleCommand("ulx","votegm", "Pick a gamemode to play next", "prop_hunt", "hideandseek")
end)
                                                   ^ title              ^ gamemodes    ^                                                               
