timer.Create("GMSwitch", 1200, 0, function()
	RunConsoleCommand("ulx","votegm", "Pick a gamemode to play next", "prop_hunt", "hideandseek")
end)
