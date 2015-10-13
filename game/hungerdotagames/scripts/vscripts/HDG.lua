counterDeathsGG = 0
counterDeathsBG = 0

function HDG:InitGameMode()



	local MapName = GetMapName()
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 5 )
	
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
	
	local point1 = Entities:FindByName( nil, "spawnSpider1"):GetAbsOrigin()
	local point2 = Entities:FindByName( nil, "spawnSpider2"):GetAbsOrigin()
	local point3 = Entities:FindByName( nil, "spawnSpider3"):GetAbsOrigin()
	local point4 = Entities:FindByName( nil, "spawnSpider4"):GetAbsOrigin()
	local point5 = Entities:FindByName( nil, "spawnSpider5"):GetAbsOrigin()
	local point6 = Entities:FindByName( nil, "spawnSpider6"):GetAbsOrigin()
	local point7 = Entities:FindByName( nil, "spawnSpider7"):GetAbsOrigin()
	local point8 = Entities:FindByName( nil, "spawnSpider8"):GetAbsOrigin()
	local point9 = Entities:FindByName( nil, "spawnSpider9"):GetAbsOrigin()
	local point10 = Entities:FindByName( nil, "spawnSpider10"):GetAbsOrigin()
	local point11 = Entities:FindByName( nil, "spawnSpider11"):GetAbsOrigin()
	local point12 = Entities:FindByName( nil, "spawnSpider12"):GetAbsOrigin()
	local point13 = Entities:FindByName( nil, "spawnSpider13"):GetAbsOrigin()
	
	
	local point14 = Entities:FindByName( nil, "spawnSkeleton1"):GetAbsOrigin()
	local point15 = Entities:FindByName( nil, "spawnSkeleton2"):GetAbsOrigin()
	local point16 = Entities:FindByName( nil, "spawnSkeleton3"):GetAbsOrigin()
	local point17 = Entities:FindByName( nil, "spawnSkeleton4"):GetAbsOrigin()
	local point18 = Entities:FindByName( nil, "spawnSkeleton5"):GetAbsOrigin()
	local point19 = Entities:FindByName( nil, "spawnSkeleton6"):GetAbsOrigin()
	local point20 = Entities:FindByName( nil, "spawnSkeleton7"):GetAbsOrigin()
	local point21 = Entities:FindByName( nil, "spawnSkeleton8"):GetAbsOrigin()
	local point22 = Entities:FindByName( nil, "spawnSkeleton9"):GetAbsOrigin()
	local point23 = Entities:FindByName( nil, "spawnSkeleton10"):GetAbsOrigin()
	
	
	local point24 = Entities:FindByName( nil, "spawnZombie1"):GetAbsOrigin()
	local point25 = Entities:FindByName( nil, "spawnZombie2"):GetAbsOrigin()
	local point26 = Entities:FindByName( nil, "spawnZombie3"):GetAbsOrigin()
	local point27 = Entities:FindByName( nil, "spawnZombie4"):GetAbsOrigin()
	local point28 = Entities:FindByName( nil, "spawnZombie5"):GetAbsOrigin()
	local point29 = Entities:FindByName( nil, "spawnZombie6"):GetAbsOrigin()
	local point30 = Entities:FindByName( nil, "spawnZombie7"):GetAbsOrigin()
	local point31 = Entities:FindByName( nil, "spawnZombie8"):GetAbsOrigin()
	local point32 = Entities:FindByName( nil, "spawnZombie9"):GetAbsOrigin()
	
	
	HDG:SpawnMoobByName("npc_spider",point1)
	HDG:SpawnMoobByName("npc_spider",point2)
	HDG:SpawnMoobByName("npc_spider",point3)
	HDG:SpawnMoobByName("npc_spider",point4)
	HDG:SpawnMoobByName("npc_spider",point5)
	HDG:SpawnMoobByName("npc_spider",point6)
	HDG:SpawnMoobByName("npc_spider",point7)
	HDG:SpawnMoobByName("npc_spider",point8)
	HDG:SpawnMoobByName("npc_spider",point9)
	HDG:SpawnMoobByName("npc_spider",point10)
	HDG:SpawnMoobByName("npc_spider",point11)
	HDG:SpawnMoobByName("npc_spider",point12)
	HDG:SpawnMoobByName("npc_spider",point13)
	
	HDG:SpawnMoobByName("npc_skeleton",point14)
	HDG:SpawnMoobByName("npc_skeleton",point15)
	HDG:SpawnMoobByName("npc_skeleton",point16)
	HDG:SpawnMoobByName("npc_skeleton",point17)
	HDG:SpawnMoobByName("npc_skeleton",point18)
	HDG:SpawnMoobByName("npc_skeleton",point19)
	HDG:SpawnMoobByName("npc_skeleton",point20)
	HDG:SpawnMoobByName("npc_skeleton",point21)
	HDG:SpawnMoobByName("npc_skeleton",point22)
	HDG:SpawnMoobByName("npc_skeleton",point23)
	
	HDG:SpawnMoobByName("npc_zombie",point24)
	HDG:SpawnMoobByName("npc_zombie",point25)
	HDG:SpawnMoobByName("npc_zombie",point26)
	HDG:SpawnMoobByName("npc_zombie",point27)
	HDG:SpawnMoobByName("npc_zombie",point28)
	HDG:SpawnMoobByName("npc_zombie",point29)
	HDG:SpawnMoobByName("npc_zombie",point30)
	HDG:SpawnMoobByName("npc_zombie",point31)
	HDG:SpawnMoobByName("npc_zombie",point32)

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
 
 
 function HDG:SpawnMoobByName(name,point)
	local unit1 = CreateUnitByName(name, point, true, nil, nil, DOTA_TEAM_NEUTRALS )
 end