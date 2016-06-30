if HDG == nil then
	_G.HDG = class({})
	print("HDG beta")
end


counterDeathsGG = 0
counterDeathsBG = 0

function HDG:InitGameMode()



	local MapName = GetMapName()
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	
	GameRules.DropTable = LoadKeyValues("scripts/kv/item_drops.kv")
	
	GameRules:SetTimeOfDay( 0.5 )
	GameRules:SetHeroRespawnEnabled( false )
	GameRules:SetUseUniversalShopMode( false )
	GameRules:SetHeroSelectionTime( 20.0 )
	GameRules:SetPreGameTime( 10.0 )
	GameRules:SetPostGameTime( 60.0 )
	GameRules:SetTreeRegrowTime( 60.0 )
	GameRules:SetHeroMinimapIconScale( 0.7 )
	GameRules:SetCreepMinimapIconScale( 0.7 )
	GameRules:SetRuneMinimapIconScale( 0.7 )
	GameRules:SetGoldTickTime( 60.0 )
	GameRules:SetGoldPerTick( 0 )
	GameRules:GetGameModeEntity():SetRemoveIllusionsOnDeath( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
	GameRules:GetGameModeEntity():SetBuybackEnabled( false )
	GameRules:GetGameModeEntity():SetRecommendedItemsDisabled( true )	

	
   Say(nil, "game start", false)
---DOTA_TEAM_BADGUYS
	ListenToGameEvent("dota_player_killed", Dynamic_Wrap(HDG, "OnHeroKilled"), self)
    ListenToGameEvent('entity_killed', Dynamic_Wrap(HDG, 'OnEntityKilled'), self)
	
	
	HDG:SpawnCreeps1()
	
	local point60 = Entities:FindByName( nil, "spawn_stalker2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_stalker",point60,1)
	local point61 = Entities:FindByName( nil, "spawn_wolf2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_wolf",point61,1)
	
end 
 

 function HDG:OnHeroKilled (data)


	local killedEntity = PlayerResource:GetSelectedHeroEntity(data.PlayerID)
	if killedEntity:GetNumItemsInInventory() ~=0 then
	   for i=0,5 do
			local item = killedEntity:GetItemInSlot(i);
			if item ~= nil then
				local position = killedEntity:GetAbsOrigin()
				local name = item:GetAbilityName()
				killedEntity:RemoveItem(item)		
				HDG:CreateDrop(name, position)
			end
		end
   end

  	--local playerName = PlayerResource:GetPlayerName(data.PlayerID) 
 	local messageinfo = { message = "Player die!", duration = 5}
	FireGameEvent("show_center_message",messageinfo)  
   
   
	local killedPlayer = PlayerResource:GetPlayer(data.PlayerID)	
	local number = killedPlayer:GetTeamNumber()
	local name =  GetTeamName(number)
	
	if name == "#DOTA_GoodGuys" then
	counterDeathsGG = counterDeathsGG + 1
	end
	if name == "#DOTA_BadGuys" then
	counterDeathsBG = counterDeathsBG + 1
	end
	
	print("time:" ..  GameRules:GetDOTATime(false, false))
	print("countDGG:" .. counterDeathsGG)
	print("countDBG:" .. counterDeathsBG)
	
	
	if counterDeathsGG == PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS) and PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS) > 0 then
		GameRules:SetGameWinner(DOTA_TEAM_BADGUYS)
		--GameRules:MakeTeamLose( DOTA_TEAM_GOODGUYS )
		
	elseif counterDeathsBG == PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS) and PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS) > 0 then
		GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
		--GameRules:MakeTeamLose( DOTA_TEAM_BADGUYS )
		
	end	
	
 end

 
 
 function HDG:OnEntityKilled (data)
    local killedUnit = EntIndexToHScript( data.entindex_killed )
    if killedUnit:IsNeutralUnitType() or killedUnit:IsCreature() then
        HDG:RollDrops(killedUnit)
    end
   end

   
  function HDG:RollDrops(unit)
    local DropInfo = GameRules.DropTable[unit:GetUnitName()]
    if DropInfo then
        for item_name,chance in pairs(DropInfo) do
            if RollPercentage(chance) then
                -- Create the item
                local item = CreateItem(item_name, nil, nil)
                local pos = unit:GetAbsOrigin()
                local drop = CreateItemOnPositionSync( pos, item )
                local pos_launch = pos+RandomVector(RandomFloat(150,200))
                item:LaunchLoot(false, 200, 0.75, pos_launch)
            end
        end
    end
end 

 function HDG:CreateDrop (itemName, pos)
   local newItem = CreateItem(itemName, nil, nil)
   newItem:SetPurchaseTime(0)
   CreateItemOnPositionSync(pos, newItem)
   newItem:LaunchLoot(false, 300, 0.75, pos + RandomVector(RandomFloat(50, 350)))
 end  
 
 
 function HDG:SpawnMoobByName(name,point,number)
	for i=1,number do
		local unit1 = CreateUnitByName(name, point + RandomVector( RandomFloat( 0, 200 ) ), true, nil, nil, DOTA_TEAM_NEUTRALS )
	end
 end
 
 
 
 function HDG:SpawnCreeps1()
 
	local point1 = Entities:FindByName( nil, "spawn_kobold1"):GetAbsOrigin()
	local point2 = Entities:FindByName( nil, "spawn_kobold2"):GetAbsOrigin()
	local point3 = Entities:FindByName( nil, "spawn_kobold3"):GetAbsOrigin()
	local point4 = Entities:FindByName( nil, "spawn_kobold4"):GetAbsOrigin()
	local point5 = Entities:FindByName( nil, "spawn_kobold5"):GetAbsOrigin()	
	HDG:SpawnMoobByName("npc_kobold",point1,3)
	HDG:SpawnMoobByName("npc_kobold",point2,3)
	HDG:SpawnMoobByName("npc_kobold",point3,3)
	HDG:SpawnMoobByName("npc_kobold",point4,3)
	HDG:SpawnMoobByName("npc_kobold",point5,3)	


	local point6 = Entities:FindByName( nil, "spawn_gnoll1"):GetAbsOrigin()
	local point7 = Entities:FindByName( nil, "spawn_gnoll2"):GetAbsOrigin()
	local point8 = Entities:FindByName( nil, "spawn_gnoll3"):GetAbsOrigin()
	local point9 = Entities:FindByName( nil, "spawn_gnoll4"):GetAbsOrigin()
	local point10 = Entities:FindByName( nil, "spawn_gnoll5"):GetAbsOrigin()	
	HDG:SpawnMoobByName("npc_gnoll",point6,3)
	HDG:SpawnMoobByName("npc_gnoll",point7,3)
	HDG:SpawnMoobByName("npc_gnoll",point8,3)
	HDG:SpawnMoobByName("npc_gnoll",point9,3)
	HDG:SpawnMoobByName("npc_gnoll",point10,3)	

	
	local point11 = Entities:FindByName( nil, "spawn_spider1"):GetAbsOrigin()
	local point12 = Entities:FindByName( nil, "spawn_spider2"):GetAbsOrigin()
	local point13 = Entities:FindByName( nil, "spawn_spider3"):GetAbsOrigin()
	local point14 = Entities:FindByName( nil, "spawn_spider4"):GetAbsOrigin()
	local point15 = Entities:FindByName( nil, "spawn_spider5"):GetAbsOrigin()	
	HDG:SpawnMoobByName("npc_spider",point11,2)
	HDG:SpawnMoobByName("npc_spider",point12,2)
	HDG:SpawnMoobByName("npc_spider",point13,2)
	HDG:SpawnMoobByName("npc_spider",point14,2)
	HDG:SpawnMoobByName("npc_spider",point15,2)

	local point16 = Entities:FindByName( nil, "spawn_ogr1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_ogr",point16,3)	
	
	local point17 = Entities:FindByName( nil, "spawn_ogr_mag1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_ogr_mag",point17,1)	
	
	local point18 = Entities:FindByName( nil, "spawn_ghost1"):GetAbsOrigin()
	local point19 = Entities:FindByName( nil, "spawn_ghost2"):GetAbsOrigin()
	local point20 = Entities:FindByName( nil, "spawn_ghost3"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_ghost",point18,2)	
	HDG:SpawnMoobByName("npc_ghost",point19,2)
	HDG:SpawnMoobByName("npc_ghost",point20,2)
	
	local point21 = Entities:FindByName( nil, "spawn_women_ghost1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_women_ghost",point21,1)

	local point22 = Entities:FindByName( nil, "spawn_bess1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_bess",point22,1)

	local point23 = Entities:FindByName( nil, "spawn_greevil1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_greevil",point23,1)	
	
	local point24 = Entities:FindByName( nil, "spawn_harpy1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_harpy",point24,1)	

	local point25 = Entities:FindByName( nil, "spawn_demon1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_demon",point25,1)

	local point26 = Entities:FindByName( nil, "spawn_golem1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_golem",point26,1)	

	local point27 = Entities:FindByName( nil, "spawn_fire_spirit1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_fire_spirit",point27,1)

	local point28 = Entities:FindByName( nil, "spawn_mekansm1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_mekansm",point28,1)	
	
	local point29 = Entities:FindByName( nil, "spawn_wraith1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_wraith",point29,1)
	
	local point30 = Entities:FindByName( nil, "spawn_pumpkin1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_pumpkin",point30,1)

	local point31 = Entities:FindByName( nil, "spawn_undying1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_undying",point31,1)	

	local point32 = Entities:FindByName( nil, "spawn_zombie1"):GetAbsOrigin()
	local point33 = Entities:FindByName( nil, "spawn_zombie2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_zombie",point32,3)	
	HDG:SpawnMoobByName("npc_zombie",point33,3)

	local point34 = Entities:FindByName( nil, "spawn_skeleton_king1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_skeleton_king",point34,1)
	
	local point35 = Entities:FindByName( nil, "spawn_skeleton1"):GetAbsOrigin()
	local point36 = Entities:FindByName( nil, "spawn_skeleton2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_skeleton",point35,3)	
	HDG:SpawnMoobByName("npc_skeleton",point36,3)	
	
	local point37 = Entities:FindByName( nil, "spawn_centaur1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_centaur",point37,1)
	
	local point38 = Entities:FindByName( nil, "spawn_junior_centaur1"):GetAbsOrigin()
	local point39 = Entities:FindByName( nil, "spawn_junior_centaur2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_junior_centaur",point38,3)	
	HDG:SpawnMoobByName("npc_junior_centaur",point39,3)	

	local point40 = Entities:FindByName( nil, "spawn_vulture1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_vulture",point40,1)	
	
	local point41 = Entities:FindByName( nil, "spawn_ancestral_spirit1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_ancestral_spirit",point41,1)
	
	local point42 = Entities:FindByName( nil, "spawn_ghost_frost1"):GetAbsOrigin()
	local point43 = Entities:FindByName( nil, "spawn_ghost_frost2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_ghost_frost",point42,3)	
	HDG:SpawnMoobByName("npc_ghost_frost",point43,3)	
	
	local point44 = Entities:FindByName( nil, "spawn_necromancer1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_necromancer",point44,1)

	local point45 = Entities:FindByName( nil, "spawn_necromancer_zombie1"):GetAbsOrigin()
	local point46 = Entities:FindByName( nil, "spawn_necromancer_sceleton1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_zombie",point45,3)	
	HDG:SpawnMoobByName("npc_skeleton",point46,3)
	
	local point47 = Entities:FindByName( nil, "spawn_earthspirit1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_earthspirit",point47,1)
	local point48 = Entities:FindByName( nil, "spawn_firespirit1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_firespirit",point48,1)
	
	local point49 = Entities:FindByName( nil, "spawn_windspirit1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_windspirit",point49,1)
	local point50 = Entities:FindByName( nil, "spawn_firespirit2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_firespirit",point50,1)
	
	local point51 = Entities:FindByName( nil, "spawn_earthspirit2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_earthspirit",point51,1)
	local point52 = Entities:FindByName( nil, "spawn_windspirit2"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_windspirit",point52,1)

	local point53 = Entities:FindByName( nil, "spawn_bear1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_bear",point53,1)

	local point54 = Entities:FindByName( nil, "spawn_death_prophet1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_death_prophet_ghost",point54,1)

	local point55 = Entities:FindByName( nil, "spawn_wolf1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_wolf",point55,1)

	local point56 = Entities:FindByName( nil, "spawn_roshan1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_roshan",point56,1)	
	
	local point57 = Entities:FindByName( nil, "spawn_water_element1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_water_element",point57,1)
	
	local point58 = Entities:FindByName( nil, "spawn_gargoyle1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_gargoyle",point58,1)
	
	local point59 = Entities:FindByName( nil, "spawn_stalker1"):GetAbsOrigin()
	HDG:SpawnMoobByName("npc_stalker",point59,1)
 
 
 end
 