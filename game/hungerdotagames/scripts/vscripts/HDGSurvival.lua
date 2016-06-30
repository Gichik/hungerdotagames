if HDGSurvival == nil then
	_G.HDGSurvival = class({})
	print("HDGSurvival beta")
end

--[[
Dist1 = nil
Dist2 = nil
Dist3 = nil
Dist4 = nil
Dist5 = nil
CounterAlive = 0
]]

XP_PER_LEVEL_TABLE = {
	0 -- 1 
 }


function HDGSurvival:InitGameMode()

	--GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
	--GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	
	GameRules.DropTable = LoadKeyValues("scripts/kv/item_drops.kv")
	
	GameRules:SetTimeOfDay( 0.5 )
	GameRules:SetHeroRespawnEnabled( true )
	GameRules:SetUseUniversalShopMode( false )
	GameRules:SetHeroSelectionTime( 20.0 )
	GameRules:SetPreGameTime( 5.0 )
	GameRules:SetPostGameTime( 60.0 )
	GameRules:SetTreeRegrowTime( 240.0 )
	GameRules:SetHeroMinimapIconScale( 0.7 )
	GameRules:SetCreepMinimapIconScale( 0.7 )
	GameRules:SetRuneMinimapIconScale( 0.7 )
	GameRules:SetGoldTickTime( 0.0 )
	GameRules:SetGoldPerTick( 0 )
	GameRules:GetGameModeEntity():SetRemoveIllusionsOnDeath( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
	GameRules:GetGameModeEntity():SetBuybackEnabled( true )
	GameRules:GetGameModeEntity():SetRecommendedItemsDisabled( true )	

	GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled( true )
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels(true)
	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(1)		
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
	
	self.m_TeamColors = {}
	self.m_TeamColors[DOTA_TEAM_GOODGUYS] = { 61, 210, 150 }	--		Teal
	self.m_TeamColors[DOTA_TEAM_BADGUYS]  = { 243, 201, 9 }		--		Yellow
	self.m_TeamColors[DOTA_TEAM_CUSTOM_1] = { 197, 77, 168 }	--      Pink
	self.m_TeamColors[DOTA_TEAM_CUSTOM_2] = { 255, 108, 0 }		--		Orange
	self.m_TeamColors[DOTA_TEAM_CUSTOM_3] = { 52, 85, 255 }		--		Blue
	self.m_TeamColors[DOTA_TEAM_CUSTOM_4] = { 101, 212, 19 }	--		Green
	self.m_TeamColors[DOTA_TEAM_CUSTOM_5] = { 129, 83, 54 }		--		Brown
	self.m_TeamColors[DOTA_TEAM_CUSTOM_6] = { 27, 192, 216 }	--		Cyan
	self.m_TeamColors[DOTA_TEAM_CUSTOM_7] = { 199, 228, 13 }	--		Olive
	self.m_TeamColors[DOTA_TEAM_CUSTOM_8] = { 140, 42, 244 }	--		Purple	
	
	
	for team = 0, (DOTA_TEAM_COUNT-1) do
		color = self.m_TeamColors[ team ]
		if color then
			SetTeamCustomHealthbarColor( team, color[1], color[2], color[3] )
		end
	end	
	
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_3, 1 )
	
   --Say(nil, "game start", false)


    ListenToGameEvent('entity_killed', Dynamic_Wrap(HDGSurvival, 'OnEntityKilled'), self)
	ListenToGameEvent("dota_player_gained_level", Dynamic_Wrap(HDGSurvival, 'OnPlayerGainedLevel'), self)	
	ListenToGameEvent('tree_cut', Dynamic_Wrap(HDGSurvival, 'OnTreeCut'), self)
	ListenToGameEvent("npc_spawned", Dynamic_Wrap(HDGSurvival, 'OnNPCSpawn'), self)
	ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(HDGSurvival, 'GameRulesStateChange'), self)
	--ListenToGameEvent("dota_player_killed", Dynamic_Wrap(HDGSurvival, "OnHeroKilled"), self)

	HDGSurvival:SpawnResources()
	
end 


function HDGSurvival:OnTreeCut(data)
local pos = Vector(data.tree_x,data.tree_y,0)
HDGSurvival:CreateDrop ("item_branch", pos, 1)
end

function HDGSurvival:OnNPCSpawn(data)

local player = EntIndexToHScript(data.entindex)

if player:IsHero() then			
	local teamNumb = player:GetTeamNumber()
	local ability = player:FindAbilityByName("change_craft")
	ability:SetLevel(1)
	ability = player:FindAbilityByName("craft_masking_dirt")
	ability:SetLevel(1)	
--	ability = player:FindAbilityByName("rot")
--	ability:SetLevel(1)
	player:SetAbilityPoints(0)
	player:SetGold(0, false) 
--[[	
	if teamNumb == DOTA_TEAM_GOODGUYS then
		Dist1 = player
	elseif teamNumb == DOTA_TEAM_BADGUYS then
		Dist2 = player
	elseif teamNumb == DOTA_TEAM_CUSTOM_1 then
		Dist3 = player
	elseif teamNumb == DOTA_TEAM_CUSTOM_2 then
		Dist4 = player
	elseif teamNumb == DOTA_TEAM_CUSTOM_3 then
		Dist5 = player	
	end
	
	CounterAlive = CounterAlive + 1
	]]
end

end


function HDGSurvival:CreateDrop (itemName, pos, charges)
   local newItem = CreateItem(itemName, nil, nil)
   newItem:SetPurchaseTime(0)
   if newItem:IsStackable() then
		newItem:SetCurrentCharges(charges)
   end
   CreateItemOnPositionSync(pos, newItem)
   newItem:LaunchLoot(false, 300, 0.75, pos + RandomVector(RandomFloat(25,25)))
end


 function HDGSurvival:GameRulesStateChange(keys)
	local newState = GameRules:State_Get()
	local first = 1
	if newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then 
		ShowGenericPopup( "#popup_title_Main", "#popup_body_Main", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
		
		Timers:CreateTimer(2,function()
			if first == 1 then
				GameRules:SendCustomMessage("<font color='#58ACFA'>James Newton Howard - The Hunger Games</font>", 0, 0)
			end
			EmitGlobalSound("HungerDotaGames.Jnewton")
			return 480
		end)
		
		Timers:CreateTimer(70,function()
			if first == 1 then
				GameRules:SendCustomMessage("<font color='#58ACFA'>Birdy - Just a game</font>", 0, 0)
			end			
			EmitGlobalSound("HungerDotaGames.Birdy")
			return 480
		end)	
		Timers:CreateTimer(245,function()
			if first == 1 then
				GameRules:SendCustomMessage("<font color='#58ACFA'>T.T.L. Deep Shadows - The Hunger Games</font>", 0, 0)
				first = 0
			end			
			EmitGlobalSound("HungerDotaGames.Ttl")
			return 480
		end)		
		
	end
end

--[[
function HDGSurvival:OnHeroKilled(data)
	EmitGlobalSound("HungerDotaGames.Applause")
	--DeepPrintTable( data )
	local killedEntity = PlayerResource:GetSelectedHeroEntity(data.PlayerID)

	if killedEntity:GetNumItemsInInventory() ~=0 then
	   for i=0,5 do
			local item = killedEntity:GetItemInSlot(i);
			if item ~= nil then
				local position = killedEntity:GetAbsOrigin()
				local name = item:GetAbilityName()
				if item:IsStackable() == true then					
					HDGSurvival:CreateDrop(name, position, item:GetCurrentCharges())
				else
					HDGSurvival:CreateDrop(name, position, 0)		
				end
				killedEntity:RemoveItem(item)
			end
		end
   end
   
   CounterAlive = CounterAlive - 1
   HDGSurvival:ChekAlive(PlayerResource:GetTeam(data.PlayerID))
   
end


function HDGSurvival:ChekAlive(team)

if CounterAlive < 2 then
	if Dist1 and  Dist1:IsAlive() then	
		local messageinfo = { message = "#popup_body_WinDist1", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
	elseif Dist2 and  Dist2:IsAlive() then
		local messageinfo = { message = "#popup_body_WinDist2", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_BADGUYS)
	elseif Dist3 and  Dist3:IsAlive() then
		local messageinfo = { message = "#popup_body_WinDist3", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_1)
	elseif Dist4 and  Dist4:IsAlive() then
		local messageinfo = { message = "#popup_body_WinDist4", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_2)
	elseif Dist5 and  Dist5:IsAlive() then
		local messageinfo = { message = "#popup_body_WinDist5", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_3)		
	end
end

end
]]
function HDGSurvival:ChekWinner(team)


	if team == DOTA_TEAM_GOODGUYS then	
		local messageinfo = { message = "#popup_body_WinDist1", duration = 5}
		FireGameEvent("show_center_message",messageinfo) 
		GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
	elseif team == DOTA_TEAM_BADGUYS then
		local messageinfo = { message = "#popup_body_WinDist2", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_BADGUYS)
	elseif team == DOTA_TEAM_CUSTOM_1 then
		local messageinfo = { message = "#popup_body_WinDist3", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_1)
	elseif team == DOTA_TEAM_CUSTOM_2 then
		local messageinfo = { message = "#popup_body_WinDist4", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_2)
	elseif team == DOTA_TEAM_CUSTOM_3 then
		local messageinfo = { message = "#popup_body_WinDist5", duration = 5}
		FireGameEvent("show_center_message",messageinfo)
		GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_3)		
	end
	
end


function HDGSurvival:OnPlayerGainedLevel(data)
local hero = PlayerResource:GetSelectedHeroEntity(data.player-1)
hero:SetAbilityPoints(0)
end

function HDGSurvival:SpawnResources()

local point = nil
local unit = nil
local ability = nil
local way = nil
local i = 0

for i = 1, 14 do
	point = Entities:FindByName( nil, "spawn_" .. i):GetAbsOrigin()
	unit = CreateUnitByName("mud", point + RandomVector(RandomFloat(300,300)), true, nil, nil, DOTA_TEAM_NEUTRALS ) 
	ability = unit:FindAbilityByName("respawn")
	ability:SetOverrideCastPoint(i)
	
	unit = CreateUnitByName("stone", point + RandomVector(RandomFloat(300,300)), true, nil, nil, DOTA_TEAM_NEUTRALS ) 
	ability = unit:FindAbilityByName("respawn")
	ability:SetOverrideCastPoint(i)	
end	


for i = 15, 28 do
	point = Entities:FindByName( nil, "spawn_" .. i):GetAbsOrigin()
	unit = CreateUnitByName(HDGSurvival:GiveNameOfResource(), point + RandomVector(RandomFloat(300,300)), true, nil, nil, DOTA_TEAM_NEUTRALS ) 
	ability = unit:FindAbilityByName("respawn")
	ability:SetOverrideCastPoint(i)
	
	unit = CreateUnitByName(HDGSurvival:GiveNameOfResource(), point + RandomVector(RandomFloat(300,300)), true, nil, nil, DOTA_TEAM_NEUTRALS ) 
	ability = unit:FindAbilityByName("respawn")
	ability:SetOverrideCastPoint(i)	
end	

end


function HDGSurvival:GiveNameOfResource()
 
 local number = RandomInt(1, 12)
 
if number == 1 or number == 2 then
	return "medicinal_herb"
elseif number == 3 then
	return "mud"
elseif number == 4 then
	return "stone"
elseif number == 5 or number == 6 then
	return "bones"
elseif number == 7 or number == 8 or number == 9 then
	return "stump"
else
	return "linen"
end

end



function HDGSurvival:OnEntityKilled (data)
    local killedUnit = EntIndexToHScript( data.entindex_killed )
    local killerEntity = nil

    if killedUnit:IsNeutralUnitType() or killedUnit:IsCreature() then
        HDGSurvival:RollDrops(killedUnit)
    end

    if killedUnit:IsHero() then
    	EmitGlobalSound("HungerDotaGames.Applause")
    	if data.entindex_attacker ~= nil then
			killerEntity = EntIndexToHScript( data.entindex_attacker )
			killerEntity:SetGold(0, false) 
			if(killerEntity:GetKills()) >= 5 then
				GameRules:SendCustomMessage( "#winner_name", killerEntity:GetPlayerID(), 0)
				HDGSurvival:ChekWinner(killerEntity:GetTeamNumber())
			end
		end
    end
end

   
  function HDGSurvival:RollDrops(unit)
    local DropInfo = GameRules.DropTable[unit:GetUnitName()]
    if DropInfo then
        for k,ItemTable in pairs(DropInfo) do
            local chance = ItemTable.Chance or 100
            local max_drops = ItemTable.Multiple or 1
            local item_name = ItemTable.Item
            for i=1,max_drops do
                if RollPercentage(chance) then
                    local item = CreateItem(item_name, nil, nil)
                    item:SetPurchaseTime(0)
                    local pos = unit:GetAbsOrigin()
                    local drop = CreateItemOnPositionSync( pos, item )
                    local pos_launch = pos+RandomVector(RandomFloat(50,50))
                    item:LaunchLoot(false, 200, 0.75, pos_launch)
                end
            end
        end
    end
end 