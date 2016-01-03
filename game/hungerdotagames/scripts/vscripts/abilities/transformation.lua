

--XCaster = nil
function Transformation(data)
	print("transformation OnSpellStart")
	print(data.caster:GetDebugName())


	local player = data.caster:GetPlayerOwner()
	local teamNumb = player:GetTeamNumber()
	print(teamNumb)
	local name =  GetTeamName(teamNumb)
	--player:SetTeam(DOTA_TEAM_BADGUYS)
	--OnNewHeroCreated("npc_dota_hero_undying",player)
	
	
  GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS)-1)
  GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS)+1)
	
	PrecacheUnitByNameAsync("npc_dota_hero_undying",
    function() 
      player:SetTeam(DOTA_TEAM_BADGUYS)

      local newHero = PlayerResource:ReplaceHeroWith(player:GetPlayerID(), "npc_dota_hero_undying", 0, 0)

      --GameMode.assignedPlayerHeroes[player:GetPlayerID()] = newHero
      
      newHero:SetTeam(DOTA_TEAM_BADGUYS)

      newHero:RespawnHero(false, false, false)

      --newHero:SetAbilityPoints(5)
      --newHero:UpgradeAbility(newHero:FindAbilityByName("petri_petrosyan_flat_joke"))
      --newHero:UpgradeAbility(newHero:FindAbilityByName("petri_petrosyan_return"))
      --newHero:UpgradeAbility(newHero:FindAbilityByName("petri_petrosyan_explore"))
      --newHero:UpgradeAbility(newHero:FindAbilityByName("petri_mini_actor_phase"))

      Timers:CreateTimer(0.03, function ()
        newHero.spawnPosition = newHero:GetAbsOrigin()
      end)
    end
    , 
  player:GetPlayerID())
	
end
