bow_shoot = class({})
numb_linear_projectile = nil

require( 'items' )

function bow_shoot:OnSpellStart()
	EmitSoundOn("Ability.PowershotPull", self:GetCaster())
end


function bow_shoot:OnChannelFinish(interrupted)

if interrupted == false then
	local caster = self:GetCaster()

	--if caster:HasItemInInventory("item_arrow") == true then
	--[[
		local data = {
			item_name	= "item_arrow",
			caster = self:GetCaster()
		}
	
		RemoveItemFromHero(data)
	]]
		local point = self:GetCaster():GetAbsOrigin() + (self:GetCaster():GetForwardVector() * 200)	
		vDirection = point - caster:GetAbsOrigin()
		vDirection = Vector(vDirection.x, vDirection.y, 0) 
		vDirection = vDirection:Normalized()	
		
		local info = {
			EffectName	= "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf",
			Ability = self,
			Source = caster,
			vSpawnOrigin = caster:GetAbsOrigin(),
			vVelocity = vDirection * 4000 * 0.7, 
			fStartRadius = 70,
			fEndRadius = 100,
			fDistance = 1500,
			Source = caster,
			iUnitTargetTeams = DOTA_UNIT_TARGET_TEAM_ENEMY,
			iUnitTargetTypes = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO,
			iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
			iVisionTeamNumber = caster:GetTeamNumber(),
			iVisionRadius = 65
		}
		numb_linear_projectile = ProjectileManager:CreateLinearProjectile( info )
		EmitSoundOn("Ability.Powershot", self:GetCaster())
		self:GetCaster():Stop()	
	--else
	--GameRules:SendCustomMessageToTeam("#popup_body_HaveNotArrow",caster:GetTeamNumber(), 0, 0)
	--end	

end

end

function bow_shoot:OnProjectileThink(vLocation)

	local units = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), vLocation, self:GetCaster(), 100,
		DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
		
	if units[ 1 ] then

		EmitSoundOn("Hero_Sniper.AssassinateDamage", units[ 1 ])

		local damage = {
			victim = units[ 1 ],
			attacker = self:GetCaster(),
			damage = 40,
			damage_type = DAMAGE_TYPE_PHYSICAL,
			ability = nil,
		}
		ApplyDamage( damage )	
		ProjectileManager:DestroyLinearProjectile(numb_linear_projectile)
		
		if units[ 1 ]:IsHero() then
			local id2 = ParticleManager:CreateParticle("particles/units/heroes/hero_life_stealer/life_stealer_infest_emerge_blood04.vpcf", PATTACH_ABSORIGIN, units[ 1 ])			
			Timers:CreateTimer(2,function()
				ParticleManager:DestroyParticle(id2, false)
				return nil
			end)
		else
			local id0 = ParticleManager:CreateParticle("particles/world_destruction_fx/tree_dire_destroy.vpcf", PATTACH_ABSORIGIN, units[ 1 ])
			EmitSoundOn("DOTA_Item.Maim", units[ 1 ])
		end
		self:RemoveItem()

	elseif GridNav:IsNearbyTree( vLocation, 25, true ) then
		EmitSoundOn("Hero_Windrunner.ShackleshotStun", self:GetCaster())
		ProjectileManager:DestroyLinearProjectile(numb_linear_projectile)
		self:RemoveItem()
	end

end

--------------------------------------------------------------------------------------------------------
function bow_shoot:OnProjectileHit(hTarget, vLocation)
	self:RemoveItem()
end

function bow_shoot:RemoveItem()
		local data = {
			item_name	= "item_bow",
			caster = self:GetCaster()
		}
		RemoveItemFromHero(data)
end