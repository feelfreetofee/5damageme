local BONES = {
--[[SKEL_L_Calf]]	[63931] = true,
--[[SKEL_R_Calf]]	[36864] = true,
--[[SKEL_L_Thigh]]	[58271] = true,
--[[SKEL_R_Thigh]]	[51826] = true,
--[[SKEL_Pelvis]]	[11816] = true
}

Citizen.CreateThread(function()
	SetPedMinGroundTimeForStungun(ped, 15000)
	while true do Wait(0)
		if HasEntityBeenDamagedByAnyPed(PlayerPedId()) then
			ped = PlayerPedId()
			Disarm(ped)
			ClearEntityLastWeaponDamage(ped)
			ClearEntityLastDamageEntity(ped)
		end
	end
end)


function Disarm(ped)
	if IsEntityDead(ped) or HasEntityBeenDamagedByWeapon(ped, -1569615261, 0) then return false end
	
	local hit, bone = GetPedLastDamageBone(ped)

	if BONES[bone] then
		SetPedToRagdoll(ped, 10000, 10000, 0, 0, 0, 0)
	end
end
