change_craft = class({})

function change_craft:OnSpellStart()

local caster = self:GetCaster()	
local number_craft_item = self:GetLevel()
--[[
craft_masking_dirt
craft_quelling_blade
craft_bone_knife
craft_club
craft_bow
craft_arrow
craft_arrow_tip
craft_bowstring
craft_grid
craft_snap_trap
--]]
if number_craft_item == 1 then
	change_ability(caster,"craft_masking_dirt","craft_quelling_blade")
	self:SetLevel(2)
elseif number_craft_item == 2 then
	change_ability(caster,"craft_quelling_blade","craft_bone_knife")
	self:SetLevel(3)
elseif number_craft_item == 3 then
	change_ability(caster,"craft_bone_knife","craft_club")
	self:SetLevel(4)
elseif number_craft_item == 4 then
	change_ability(caster,"craft_club","craft_bow")
	self:SetLevel(5)
--[[
elseif number_craft_item == 5 then
	change_ability(caster,"craft_bow","craft_arrow")
	self:SetLevel(6)
elseif number_craft_item == 6 then
	change_ability(caster,"craft_arrow","craft_arrow_tip")
	self:SetLevel(7)
elseif number_craft_item == 7 then
	change_ability(caster,"craft_arrow_tip","craft_bowstring")
	self:SetLevel(8)
]]
elseif number_craft_item == 5 then
	change_ability(caster,"craft_bow","craft_grid")
	self:SetLevel(6)
elseif number_craft_item == 6 then
	change_ability(caster,"craft_grid","craft_snap_trap")
	self:SetLevel(7)
elseif number_craft_item == 7 then
	change_ability(caster,"craft_snap_trap","craft_masking_dirt")
	self:SetLevel(1)	
end

end


function change_ability(caster,del_ability,added_ability)
	local ability = nil
	ability = caster:FindAbilityByName(del_ability)
	
	if ability ~= nil then
		caster:RemoveAbility(del_ability)
	end

	if caster:FindAbilityByName(added_ability) == nil then
		caster:AddAbility(added_ability)
		ability = caster:FindAbilityByName(added_ability)
		ability:SetLevel(1)
	end	
end