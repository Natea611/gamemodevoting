-- Gamemode voting
local function votegmDone( t )
	local results = t.results
	local winner
	local winnernum = 0
	for id, numvotes in pairs( results ) do
		if numvotes > winnernum then
			winner = id
			winnernum = numvotes
		end
	end

	local str
	if not winner then
		str = "Vote results: No option won because no one voted!"
	else
		str = "Vote results: Option '" .. t.options[ winner ] .. "' won. (" .. winnernum .. "/" .. t.voters .. ")"
		RunConsoleCommand("ulx","rcon", "gamemode " .. t.options[ winner ])
	end
	ULib.tsay( _, str ) -- TODO, color?
	ulx.logString( str )
	Msg( str .. "\n" )
end

function ulx.votegm( calling_ply, title, ... )
	if ulx.voteInProgress then
		ULib.tsayError( calling_ply, "There is already a vote in progress. Please wait for the current one to end.", true )
		return
	end

	ulx.doVote( title, { ... }, votegmDone )
	ulx.fancyLogAdmin( calling_ply, "#A started a vote (#s)", title )
	
end
local votegm = ulx.command( "GamemodeVote", "ulx votegm", ulx.votegm, "!gm" )
votegm:addParam{ type=ULib.cmds.StringArg, hint="title" }
votegm:addParam{ type=ULib.cmds.StringArg, hint="options", ULib.cmds.takeRestOfLine, repeat_min=2, repeat_max=10 }
votegm:defaultAccess( ULib.ACCESS_ADMIN )
votegm:help( "Starts a gamemode vote." )
