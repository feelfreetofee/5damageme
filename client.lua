local BONES = {
--[[SKEL_L_Calf]]	63931,
--[[SKEL_R_Calf]]	36864,
--[[SKEL_L_Thigh]]	58271,
--[[SKEL_R_Thigh]]	51826,
--[[SKEL_Pelvis]]	11816
}
Citizen.CreateThread(function()
	local ped = PlayerPedId()
	SetPedMinGroundTimeForStungun(ped, 15000)
	while true do Wait(0)
		if HasEntityBeenDamagedByAnyPed(ped) then
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
		SetPedToRagdoll(ped, 5000, 5000, 0, 0, 0, 0)
	end
end
