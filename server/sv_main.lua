--[[
	Script : ByYoSe WHKey system
	Created by : ByYoSe
]]

ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("byyose:keyjobwh", function(source, cb, hashKey)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local HasWhitelist = false
		for k, v in pairs(ByYoSe.Config.WhitelistCars) do
			if hashKey == v.model then
				for _,y in ipairs (ByYoSe.Config.WhitelistCars[k].job) do
					if xPlayer.job.name == y then
						HasWhitelist = true
					end
				end
			end
		end
		if HasWhitelist then
			cb(true)
		else
			cb(false)
		end
	end
end)
