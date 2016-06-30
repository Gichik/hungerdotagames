rot = class({})

require( 'HDGSurvival' )

function rot:OnOwnerDied()
	local caster = self:GetCaster()
	local team = caster:GetTeamNumber()
	local point = caster:GetAbsOrigin()
	
	if caster:IsHero() then
		ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MHeroDie", "#popup_body_MHeroDie", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
	else
		ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MSnakeDie", "#popup_body_MSnakeDie", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
	end
	
	Timers:CreateTimer(20,function()	
		if team == DOTA_TEAM_GOODGUYS then
			rot:SpawnSnake(Dist1,point)
		elseif team == DOTA_TEAM_BADGUYS then
			rot:SpawnSnake(Dist2,point)
		elseif team == DOTA_TEAM_CUSTOM_1 then
			rot:SpawnSnake(Dist3,point)
		elseif team == DOTA_TEAM_CUSTOM_2 then
			rot:SpawnSnake(Dist4,point)
		elseif team == DOTA_TEAM_CUSTOM_3 then
			rot:SpawnSnake(Dist5,point)	
		end	
		
		return nil
	end)

	GameRules:GetGameModeEntity():SetContextThink(string.format("CreatureThink_%d", RandomInt(1, 99999)), 
			function()
				rot:SpawnSnake()
			return nil
			end,
			20)


	
end


function rot:SpawnSnake(hero, point)
local unit = CreateUnitByName("npc_snake", point, true, nil, nil, hero:GetTeamNumber() ) 
unit:SetOwner(hero)
print(hero:GetPlayerOwnerID())
unit:SetControllableByPlayer( hero:GetPlayerOwnerID(), true )
end