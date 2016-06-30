function Respawn(data)
local name = data.caster:GetUnitName()
local ability = data.caster:FindAbilityByName("respawn")
local IDspawn = ability:GetCastPoint()

Timers:CreateTimer(120,function()
	local point = Entities:FindByName( nil, "spawn_" .. IDspawn ):GetAbsOrigin()
	local unit = CreateUnitByName(name, point + RandomVector( RandomFloat(300, 300) ), true, nil, nil, DOTA_TEAM_NEUTRALS )
	ability = unit:FindAbilityByName("respawn")
	ability:SetOverrideCastPoint(IDspawn)
return nil
end)
end