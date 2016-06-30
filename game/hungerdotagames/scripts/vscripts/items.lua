function GiveInvisible(data)
local hero = data.caster

--print("GiveInvisible")
	
if hero:FindAbilityByName("hide") == nil then
	hero:AddAbility("hide")
	local ability = hero:FindAbilityByName("hide")
	ability:SetLevel(1)
	hero:CastAbilityOnTarget(hero,ability,hero:GetPlayerOwnerID())
	StartSoundEvent("DOTA_Item.InvisibilitySword.Activate", hero)
	hero:RemoveAbility("hide")
end

end



function AddAbilityToHero(data)
--print("AddAbilityToActivator")
--print(data.ability_name)
local hero = data.caster
if hero:FindAbilityByName(data.ability_name) == nil then
	hero:AddAbility(data.ability_name)
	local ability = hero:FindAbilityByName(data.ability_name)
	ability:SetLevel(1)
end
end


function RemoveAbilityFromHero(data)
--print("RemoveAbilityToActivator")
local hero = data.caster

if hero:HasItemInInventory(data.item_name) == false then
	local ability = hero:FindAbilityByName(data.ability_name)
	hero:RemoveAbility(data.ability_name)
end

end


function GiveMana(data)
--print("give mana")
data.caster:GiveMana(100)
EmitSoundOn("Item.MoonShard.Consume", data.caster)
end


function GiveHealthParticle(data)
print("give heal")
local id0 = ParticleManager:CreateParticle("particles/units/heroes/hero_oracle/oracle_purifyingflames_heal.vpcf", PATTACH_ABSORIGIN_FOLLOW , data.caster)
local id1 = ParticleManager:CreateParticle("particles/units/heroes/hero_bloodseeker/bloodseeker_bloodbath_heal.vpcf", PATTACH_ABSORIGIN_FOLLOW , data.caster)
--StartSoundEvent("DOTA_Item.FaerieSpark.Activate", data.caster)
Timers:CreateTimer(3,function()
	ParticleManager:DestroyParticle(id0, false)
	return nil
end)
EmitAnnouncerSoundForPlayer("DOTA_Item.FaerieSpark.Activate", data.caster:GetPlayerOwnerID())
end

function CreatTree(data)
print(data.target_points[1])
local point = data.target_points[1]
CreateTempTree(point,15)
end


function CreatGrid(data)
local hero = data.caster
local target = data.target
if hero:FindAbilityByName("use_grid") == nil then
	hero:AddAbility("use_grid")
	local ability = hero:FindAbilityByName("use_grid")
	ability:SetLevel(1)
	hero:CastAbilityOnTarget(target,ability,hero:GetPlayerOwnerID())
	StartSoundEvent("DOTA_Item.InvisibilitySword.Activate", hero)
	hero:RemoveAbility("use_grid")
end
end

function CreateSnapTrap(data)
data.target:SetHullRadius(60.0)
data.target:SetForwardVector(data.caster:GetForwardVector())
end


function DestroyBuilding(data)
local id0 = ParticleManager:CreateParticle("particles/world_destruction_fx/tree_dire_destroy.vpcf", PATTACH_ABSORIGIN, data.caster)
StartSoundEvent("DOTA_Item.Maim", data.caster)
data.caster:ForceKill(false)
end

function RemoveItemFromHero(data)
local caster = data.caster
local item = nil
local charges = 0
local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == data.item_name and first == 0 then
				if item:IsStackable() == true then
					if item:GetCurrentCharges() > 1 then
						charges = item:GetCurrentCharges()
						item:SetCurrentCharges(charges-1)
					else
						caster:RemoveItem(item)
					end
				else
					caster:RemoveItem(item)			
				end
				first = 1
			end
		end
	end	
end

function GiveTeam(data)
print("give team")
local team = data.activator:GetTeam()
print(GetTeamName(team))
end