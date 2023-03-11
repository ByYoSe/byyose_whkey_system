--[[
	Script : ByYoSe WHKey system
	Created by : ByYoSe
]]


ESX = exports['es_extended']:getSharedObject()

local isRunningWorkaround = false

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(5)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 10.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback("byyose:keyjobwh", function(canLock)
		if canLock then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)
	
			if lockStatus == 1 then -- unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				if ByYoSe.Config.Notify == "OKOKNotify" then
					exports['okokNotify']:Alert('', "Véhicule: <span style='color:#f05c5c'>vérrouiller</span>", 5000, 'success')
				elseif ByYoSe.Config.Notify == "ESX" then
					ESX.ShowNotification("Véhicule: ~g~vérrouiller")
				end
			elseif lockStatus == 2 then -- locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				if ByYoSe.Config.Notify == "OKOKNotify" then
					exports['okokNotify']:Alert('', "Véhicule: <span style='color:#47cf73'>déverrouiller</span>", 5000, 'success')
				elseif ByYoSe.Config.Notify == "ESX" then
					ESX.ShowNotification("Véhicule: ~r~déverrouiller")
				end
			end
		else
			if ByYoSe.Config.Notify == "OKOKNotify" then
				exports['okokNotify']:Alert('', 'Ce véhicule ne vous appartient pas.', 5000, 'error')
			elseif ByYoSe.Config.Notify == "ESX" then
				ESX.ShowNotification("Ce véhicule ne vous appartient pas.")
			end
		end
	end, GetEntityModel(vehicle))
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if IsControlJustReleased(0, 303) and IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
		end
	end
end)
