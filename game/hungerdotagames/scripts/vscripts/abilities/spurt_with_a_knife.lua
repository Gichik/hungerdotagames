spurt_with_a_knife = class({})


function spurt_with_a_knife:OnSpellStart()
	
	EmitSoundOn("Hero_Axe.BerserkersCall.Start", self:GetCaster())
	--EmitAnnouncerSoundForPlayer("Hero_Axe.BerserkersCall.Start", self:GetCaster():GetPlayerOwnerID())
	--StartSoundEvent("Hero_Axe.BerserkersCall.Start", self:GetCaster())
	local caster = self:GetCaster()
	local step = 100
	local direction = caster:GetForwardVector()
	local StartPosition = caster:GetAbsOrigin()
	local NextPosition = StartPosition + direction * step
	
	local id1 = ParticleManager:CreateParticle("particles/units/heroes/hero_magnataur/magnataur_skewer_rocks.vpcf", PATTACH_ABSORIGIN, caster)	
	Timers:CreateTimer(1,function()
		ParticleManager:DestroyParticle(id1, false)
		return nil
	end)

	Timers:CreateTimer(0.05,function()
	
		local id2 = ParticleManager:CreateParticle("particles/units/heroes/hero_magnataur/magnataur_skewer_dust_b.vpcf", PATTACH_ABSORIGIN, caster)	
		Timers:CreateTimer(0.5,function()
			ParticleManager:DestroyParticle(id2, false)
			return nil
		end)
	
		local units = FindUnitsInRadius( caster:GetTeamNumber(), NextPosition, caster, 100, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
			
		if units[ 1 ] then  
			EmitSoundOn("Hero_BountyHunter.Jinada", units[ 1 ])

			local damage = {
				victim = units[ 1 ],
				attacker = self:GetCaster(),
				damage = 30,
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = this,
			}		
			ApplyDamage( damage )
							
			if units[ 1 ]:IsHero() then
			local id3 = ParticleManager:CreateParticle("particles/units/heroes/hero_life_stealer/life_stealer_infest_emerge_blood04.vpcf", PATTACH_ABSORIGIN, units[ 1 ])			
				Timers:CreateTimer(2,function()
					ParticleManager:DestroyParticle(id3, false)
					return nil
				end)
			else
				local id0 = ParticleManager:CreateParticle("particles/world_destruction_fx/tree_dire_destroy.vpcf", PATTACH_ABSORIGIN, units[ 1 ])
				EmitSoundOn("DOTA_Item.Maim", units[ 1 ])
			end
			
			return nil		

		elseif GridNav:IsNearbyTree( NextPosition, 50, true ) then
			EmitSoundOn("Hero_Sven.IronWill", caster)
			return nil		
		else
			caster:SetAbsOrigin(NextPosition)
			NextPosition = StartPosition + direction * step
		end
		
		step = step+100
		if step < 1000 then
			return 0.05
		else 
			return nil
		end		

	end)
	
end