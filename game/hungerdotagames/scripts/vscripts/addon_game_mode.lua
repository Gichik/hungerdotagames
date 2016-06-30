-- Generated from template



--if hdg == nil then
--	hdg = class({})
--end




require( 'HDG' )
require( 'HDGSurvival' )
require( 'timers' )



function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]	
	
	-----------------------------moobs-----------------------------------
	--[[PrecacheUnitByNameSync("npc_zombie", context)
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
	
	--]]
	-----------------------------items-----------------------------------
	
	PrecacheModel("models/props_destruction/lava_flow_clump.vmdl", context) -- item_mud -
	PrecacheModel("models/props_nature/mushroom_wild_02.vmdl", context) -- item_linen
	PrecacheModel("models/particle/tiny_rocks.vmdl", context) -- item_stone
	PrecacheModel("models/props_bones/bone002.vmdl", context) -- item_bone_fragments -
	PrecacheModel("models/items/earthshaker/egset_particlerocks/egset_particlerocks.vmdl", context) -- item_arrow_tip
	PrecacheModel("models/particle/legion_arrow.vmdl", context) -- item_arrow
	PrecacheModel("models/items/furion/father_shoulder/father_shoulder.vmdl", context) -- item_bowstring
	PrecacheModel("models/props_nature/lily_flower00.vmdl", context) -- item_medicinal_herb
	PrecacheModel("models/props_gameplay/branch.vmdl", context) -- item_branch
	PrecacheModel("models/props_nature/bush_00.vmdl", context) -- item_masking_dirt	
	PrecacheModel("models/particle/net.vmdl", context) -- grid
	PrecacheModel("models/pets/items/bone001.vmdl", context) -- item_bone_knife -
	PrecacheModel("models/items/windrunner/makeshifthornwoodbow_v10/makeshifthornwoodbow_v10.vmdl", context) -- item_bow
	PrecacheModel("models/items/rattletrap/battletrap_weapon/battletrap_weapon.vmdl", context) -- item_lance
	PrecacheModel("models/items/ogre_magi/embersceptre/embersceptre.vmdl", context) -- item_club
	PrecacheModel("models/items/bounty_hunter/back_jawtrap.vmdl", context) -- item_snap_trap
	
	PrecacheModel("models/props_structures/wood_wall004.vmdl", context) -- wood wall
	
	PrecacheModel("models/items/pugna/ward/weta_call_of_the_nether_lotus_ward/weta_call_of_the_nether_lotus_ward.vmdl", context) -- resurce_medicinal_herb
	PrecacheModel("models/props_rock/riveredge_rocks_small007.vmdl", context) -- resurce_stone
	PrecacheModel("models/props_nature/mushroom_wild_02.vmdl", context) -- resurce_linen
	PrecacheModel("models/props_bones/badside_bones003.vmdl", context) -- resurce_bone
	PrecacheModel("models/props_tree/stump002.vmdl", context) -- resurce_branch
	PrecacheModel("models/props_destruction/rockyspikes_dynamic.vmdl", context) -- resurce_mud
	
	
	PrecacheModel("models/props_nature/fern003.vmdl", context) -- resurce_linen
	
	
	---------------------------------spells-------------------------------
	PrecacheResource("particle", "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf", context) --bow shoot	
	PrecacheResource("particle", "particles/econ/events/league_teleport_2014/teleport_end_dust_league.vpcf", context) --bow shoot		
	PrecacheResource("particle", "particles/units/heroes/hero_life_stealer/life_stealer_infest_emerge_blood04.vpcf", context) --blood bow shoot
	PrecacheResource("particle", "particles/generic_gameplay/dropped_dust.vpcf", context) --mud
	PrecacheResource("particle", "particles/units/heroes/hero_magnataur/magnataur_skewer_dust_b.vpcf", context) --spurt with knife
	PrecacheResource("particle", "particles/units/heroes/hero_magnataur/magnataur_skewer_rocks.vpcf", context) --spurt with knife
	PrecacheResource("particle", "particles/generic_gameplay/generic_hit_blood.vpcf", context) --blow bat
	PrecacheResource("particle", "particles/units/heroes/hero_beastmaster/beastmaster_wildaxe_dust_swirl.vpcf", context) --blow bat
	PrecacheResource("particle", "particles/units/heroes/hero_axe/axe_attack_blur_counterhelix.vpcf", context) --blow bat
	PrecacheResource("particle", "particles/world_destruction_fx/tree_dire_destroy.vpcf", context) --trap
	PrecacheResource("particle", "particles/units/heroes/hero_oracle/oracle_purifyingflames_heal.vpcf", context) --heal
	PrecacheResource("particle", "particles/units/heroes/hero_bloodseeker/bloodseeker_bloodbath_heal.vpcf", context) --heal
	PrecacheResource("particle", "particles/custom/nightelf/faerie_fire.vpcf", context) --heal
	


	-------------------------------sounds--------------------------------
	PrecacheResource( "soundfile", "soundevents/hungerdotagames_sounds_custom.vsndevts", context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_sven.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_bounty_hunter.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_furion.vsndevts", context)
	
	local pathToIG = LoadKeyValues("scripts/items/items_game.txt") 

	PrecacheForHero("npc_dota_hero_venomancer",pathToIG,context)
	
	end

	
function PrecacheForHero(name,path,context)


print("----------------------------------------Precache for hero Start----------------------------------------")

	local wearablesList = {} --переменная для надеваемых шмоток(для всех героев)
	local precacheWearables = {} --переменная только для шмоток нужного героя
	local precacheParticle = {}
	for k, v in pairs(path) do
		if k == 'items' then
			wearablesList = v
		end
	end
	local counter = 0
	local counter_particle = 0
	local value
	for k, v in pairs(wearablesList) do -- выбираем из списка предметов только предметы на нужных героев
		if IsForHero(name, wearablesList[k]) then
			if wearablesList[k]["model_player"] then
				value = wearablesList[k]["model_player"] 
				precacheWearables[value] = true
			end
			if wearablesList[k]["particle_file"] then -- прекешируем еще и частицы, куда ж без них!
				value = wearablesList[k]["particle_file"] 
				precacheParticle[value] = true
			end
		end
	end

	for wearable,_ in pairs( precacheWearables ) do --собственно само прекеширование всех занесенных в список шмоток
		print("Precache model: " .. wearable)
		PrecacheResource( "model", wearable, context )
		counter = counter + 1
	end

	for wearable,_ in pairs( precacheParticle) do --и прекеширование частиц
		print("Precache particle: " .. wearable)
		PrecacheResource( "particle", wearable, context )
		counter_particle = counter_particle + 1

	end

	PrecacheUnitByNameSync(name, context) -- прекешируем саму модель героя! иначе будут бегать шмотки без тела
		
    print('[Precache]' .. counter .. " models loaded and " .. counter_particle .." particles loaded")
	print('[Precache] End')

end

function IsForHero(str, tbl)
	if type(tbl["used_by_heroes"]) ~= type(1) and tbl["used_by_heroes"] then -- привет от вашего друга, индийского быдлокодера работающего за еду
		if tbl["used_by_heroes"][str] then
			return true
		end
	end
	return false
end	
	
	
	
	
-- Create the game mode when we activate
function Activate()

local MapName = GetMapName()
--print(MapName)

if MapName == "hdg_survival_small" then
	print("----------------------------------------HDGTEST Start----------------------------------------")	
	--print(MapName)
	HDGSurvival:InitGameMode()
end

if MapName == "hdg_minimap" then
	print("----------------------------------------HDG Start----------------------------------------")	
	--print(MapName)
	HDG:InitGameMode()
end

	
end

