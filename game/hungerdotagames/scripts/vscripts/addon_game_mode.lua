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
	
	PrecacheModel("models/creeps/neutral_creeps/n_creep_kobold/kobold_b/n_creep_kobold_b.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_gnoll/n_creep_gnoll.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_ogre_med/n_creep_ogre_med.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_ogre_lrg/n_creep_ogre_lrg.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_ghost_b/n_creep_ghost_b.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_ghost_a/n_creep_ghost_a.vmdl", context)
	PrecacheModel("models/courier/imp/imp_flying.vmdl", context)
	PrecacheModel("models/courier/mega_greevil_courier/mega_greevil_courier.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_harpy_b/n_creep_harpy_b.vmdl", context)
	PrecacheModel("models/heroes/shadow_demon/shadow_demon.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_golem_b/n_creep_golem_b.vmdl", context)
	PrecacheModel("models/heroes/invoker/forge_spirit.vmdl", context)
	PrecacheModel("models/courier/mech_donkey/mech_donkey_flying.vmdl", context)
	PrecacheModel("models/items/courier/mlg_courier_wraith/mlg_courier_wraith.vmdl", context)
	PrecacheModel("models/items/courier/pumpkin_courier/pumpkin_courier.vmdl", context)
	PrecacheModel("models/heroes/undying/undying_flesh_golem.vmdl", context)
	PrecacheModel("models/heroes/wraith_king/wraith_frost.vmdl", context)
	PrecacheModel("models/heroes/centaur/centaur.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_centaur_med/n_creep_centaur_med.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_vulture_a/n_creep_vulture_a.vmdl", context)
	PrecacheModel("models/heroes/elder_titan/ancestral_spirit.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_ghost_b/n_creep_ghost_frost.vmdl", context)
	PrecacheModel("models/heroes/necrolyte/necrolyte.vmdl", context)
	PrecacheModel("models/heroes/brewmaster/brewmaster_earthspirit.vmdl", context)
	PrecacheModel("models/heroes/brewmaster/brewmaster_firespirit.vmdl", context)
	PrecacheModel("models/heroes/brewmaster/brewmaster_windspirit.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_furbolg/n_creep_furbolg_disrupter.vmdl", context)
	PrecacheModel("models/heroes/death_prophet/death_prophet_ghost.vmdl", context)
	PrecacheModel("models/heroes/beastmaster/beastmaster_beast.vmdl", context)
	PrecacheModel("models/creeps/roshan/roshan.vmdl", context)
	PrecacheModel("models/heroes/morphling/morphling.vmdl", context)
	PrecacheModel("models/creeps/neutral_creeps/n_creep_jungle_stalker/n_creep_gargoyle_jungle_stalker.vmdl", context)
	PrecacheModel("models/heroes/nightstalker/nightstalker_night.vmdl", context)
	
	
	
	--PrecacheModel("models/items/broodmother/spiderling/virulent_matriarchs_spiderling/virulent_matriarchs_spiderling.vmdl", context)
	--PrecacheModel("models/heroes/undying/undying_minion.vmdl", context)
	
	end

-- Create the game mode when we activate
function Activate()
	HDG:InitGameMode()
end

