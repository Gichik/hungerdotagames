function StartSoundHammer(data)
EmitAnnouncerSoundForPlayer("HungerDotaGames.Hammer", data.caster:GetPlayerOwnerID())
end

function craft_masking_dirt(data)

local caster = data.caster

if caster:HasItemInInventory("item_mud") and 	caster:HasItemInInventory("item_linen") and caster:HasItemInInventory("item_branch") then
	RemoveItemFromHero(caster,"item_mud")
	RemoveItemFromHero(caster,"item_linen")
	RemoveItemFromHero(caster,"item_branch")
	CreateDrop ("item_masking_dirt", caster:GetAbsOrigin())
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftMaskingDirt", "#popup_body_MCantCraftMaskingDirt", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function craft_bone_knife(data)

local caster = data.caster

if caster:HasItemInInventory("item_bone_fragments") and 	caster:HasItemInInventory("item_stone") then
	RemoveItemFromHero(caster,"item_bone_fragments")
	RemoveItemFromHero(caster,"item_stone")
	CreateDrop ("item_bone_knife", caster:GetAbsOrigin())
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBoneKnife", "#popup_body_MCantCraftBoneKnife", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end



function craft_arrow(data)

local caster = data.caster

if caster:HasItemInInventory("item_linen") and caster:HasItemInInventory("item_branch") and caster:HasItemInInventory("item_arrow_tip") then
	RemoveItemFromHero(caster,"item_linen")
	RemoveItemFromHero(caster,"item_branch")
	RemoveItemFromHero(caster,"item_arrow_tip")	
	CreateDrop ("item_arrow", caster:GetAbsOrigin())
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftArrow", "#popup_body_MCantCraftArrow", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end

function craft_arrow_tip(data)

local caster = data.caster

if caster:HasItemInInventory("item_stone") then
	local item = nil
	local charges = 0
	local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_stone" and first == 0 then
				if item:GetCurrentCharges() > 1 then
					charges = item:GetCurrentCharges()
					if charges == 2 then
						caster:RemoveItem(item)
					else
						item:SetCurrentCharges(charges-2)
					end
					CreateDrop ("item_arrow_tip", caster:GetAbsOrigin())
				else
					ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftArrowTip", "#popup_body_MCantCraftArrowTip", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
				end
				first = 1
			end
		end
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftArrowTip", "#popup_body_MCantCraftArrowTip", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function craft_bowstring(data)

local caster = data.caster

if caster:HasItemInInventory("item_linen") and (caster:HasItemInInventory("item_bone_knife") or caster:HasItemInInventory("item_quelling_blade")) then
	local item = nil
	local charges = 0
	local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_linen" and first == 0 then
				if item:GetCurrentCharges() > 2 then
					charges = item:GetCurrentCharges()
					if charges == 3 then
						caster:RemoveItem(item)
					else
						item:SetCurrentCharges(charges-3)
					end
					CreateDrop ("item_bowstring", caster:GetAbsOrigin())
				else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBowstring", "#popup_body_MCantCraftBowstring", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
				end
				first = 1
			end
		end
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBowstring", "#popup_body_MCantCraftBowstring", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end

function craft_grid(data)

local caster = data.caster

if caster:HasItemInInventory("item_linen") and (caster:HasItemInInventory("item_bone_knife") or caster:HasItemInInventory("item_quelling_blade")) then
	local item = nil
	local charges = 0
	local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_linen" and first == 0 then
				if item:GetCurrentCharges() > 5 then
					charges = item:GetCurrentCharges()
					if charges == 6 then
						caster:RemoveItem(item)
					else
						item:SetCurrentCharges(charges-6)
					end
					CreateDrop ("item_grid", caster:GetAbsOrigin())
				else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftGrid", "#popup_body_MCantCraftGrid", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
				end
				first = 1
			end
		end
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftGrid", "#popup_body_MCantCraftGrid", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end

--[[
function craft_bow(data)

local caster = data.caster

if caster:HasItemInInventory("item_bowstring") and caster:HasItemInInventory("item_branch") and
(caster:HasItemInInventory("item_bone_knife") or caster:HasItemInInventory("item_quelling_blade")) then
	local item = nil
	local charges = 0
	local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_branch" and first == 0 then
				if item:GetCurrentCharges() > 1 then
					charges = item:GetCurrentCharges()
					if charges == 2 then
						caster:RemoveItem(item)
					else
						item:SetCurrentCharges(charges-2)
					end
					RemoveItemFromHero(caster,"item_bowstring")					
					CreateDrop ("item_bow", caster:GetAbsOrigin())
				else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBow", "#popup_body_MCantCraftBow", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
				end
				first = 1
			end
		end
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBow", "#popup_body_MCantCraftBow", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end

]]

function craft_bow(data)

local caster = data.caster

if caster:HasItemInInventory("item_linen") and caster:HasItemInInventory("item_branch") and caster:HasItemInInventory("item_stone") 
	and (caster:HasItemInInventory("item_bone_knife") or caster:HasItemInInventory("item_quelling_blade")) then
	RemoveItemFromHero(caster,"item_linen")
	RemoveItemFromHero(caster,"item_branch")
	RemoveItemFromHero(caster,"item_stone")
	RemoveItemFromHero(caster,"item_stone")			
	CreateDrop ("item_bow", caster:GetAbsOrigin())
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftBow", "#popup_body_MCantCraftBow", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function craft_quelling_blade(data)

local caster = data.caster

if caster:HasItemInInventory("item_stone") and caster:HasItemInInventory("item_branch") and caster:HasItemInInventory("item_linen") then
	local item = nil
	local charges = 0
	local check = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_stone" or item:GetAbilityName() == "item_linen" or item:GetAbilityName() == "item_branch" then
				if item:GetCurrentCharges() > 1 then
					check = check+1
				end
			end
		end
	end	
	
	if check > 2 then 
		RemoveItemFromHero(caster,"item_stone")	
		RemoveItemFromHero(caster,"item_stone")	
		RemoveItemFromHero(caster,"item_linen")	
		RemoveItemFromHero(caster,"item_linen")	
		RemoveItemFromHero(caster,"item_branch")
		RemoveItemFromHero(caster,"item_branch")		
		CreateDrop ("item_quelling_blade", caster:GetAbsOrigin())	
	else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftQuelllingBlade", "#popup_body_MCantCraftQuelllingBlade", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
	end
	
	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftQuelllingBlade", "#popup_body_MCantCraftQuelllingBlade", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function craft_snap_trap(data)

local caster = data.caster

if caster:HasItemInInventory("item_bone_fragments") and caster:HasItemInInventory("item_branch") and caster:HasItemInInventory("item_linen") then
	local item = nil
	local charges = 0
	local check = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_bone_fragments" then
				if item:GetCurrentCharges() > 1 then
					check = check+1
				end
			end
			if item:GetAbilityName() == "item_branch" then
				if item:GetCurrentCharges() > 1 then
					check = check+1
				end
			end			
		end
	end	
	
	if check > 1 then 
		RemoveItemFromHero(caster,"item_bone_fragments")	
		RemoveItemFromHero(caster,"item_bone_fragments")		
		RemoveItemFromHero(caster,"item_linen")	
		RemoveItemFromHero(caster,"item_branch")
		RemoveItemFromHero(caster,"item_branch")		
		CreateDrop ("item_snap_trap", caster:GetAbsOrigin())	
	else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftSnapTrap", "#popup_body_MCantCraftSnapTrap", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftSnapTrap", "#popup_body_MCantCraftSnapTrap", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function craft_club(data)

local caster = data.caster

if caster:HasItemInInventory("item_linen") and caster:HasItemInInventory("item_branch") then
	local item = nil
	local charges = 0
	local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == "item_branch" and first == 0 then
				if item:GetCurrentCharges() > 2 then
					charges = item:GetCurrentCharges()
					if charges == 3 then
						caster:RemoveItem(item)
					else
						item:SetCurrentCharges(charges-3)
					end
					RemoveItemFromHero(caster,"item_linen")					
					CreateDrop ("item_club", caster:GetAbsOrigin())
				else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftClub", "#popup_body_MCantCraftClub", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
				end
				first = 1
			end
		end
	end	
else
	ShowGenericPopupToPlayer( caster:GetPlayerOwner(), "#popup_title_MCantCraftClub", "#popup_body_MCantCraftClub", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
end

end


function RemoveItemFromHero(caster,itemName)
local item = nil
local charges = 0
local first = 0
	for i = 0, 5 do
		item = caster:GetItemInSlot(i)
		if item ~= nil then
			if item:GetAbilityName() == itemName and first == 0 then
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


function CreateDrop (itemName, pos)
   local newItem = CreateItem(itemName, nil, nil)
   newItem:SetPurchaseTime(0)
   CreateItemOnPositionSync(pos, newItem)
   newItem:LaunchLoot(false, 300, 0.75, pos)
end 