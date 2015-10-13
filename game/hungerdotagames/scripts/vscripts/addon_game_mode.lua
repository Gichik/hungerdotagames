-- Generated from template

if HDG == nil then
	_G.HDG = class({})
	print("HDG beta")
	--Convar:SendToConsole("sv_cheats 1")
end

--if hdg == nil then
--	hdg = class({})
--end




require( 'HDG' )
require( 'timers' )
require( 'barebones' )


function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]	

	PrecacheUnitByNameSync("npc_zombie", context)
	PrecacheUnitByNameSync("npc_spider", context)
	PrecacheUnitByNameSync("npc_skeleton", context)
	--PrecacheModel("models/items/broodmother/spiderling/virulent_matriarchs_spiderling/virulent_matriarchs_spiderling.vmdl", context)
	--PrecacheModel("models/heroes/undying/undying_minion.vmdl", context)
	
	end

-- Create the game mode when we activate
function Activate()
	HDG:InitGameMode()
end

