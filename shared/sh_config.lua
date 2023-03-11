--[[
	Script : ByYoSe WHKey system
	Created by : ByYoSe
    Site : https://byyose.fr/
]]

ByYoSe = {}
ByYoSe.Config = {}

ByYoSe.Config.Notify = 'ESX' --ESX or OKOKNotify

ByYoSe.Config.WhitelistCars = {
    [1] = {model = GetHashKey('police7'), job = {"police"}},
    [2] = {model = GetHashKey('police6'), job = {"police"}},
    [3] = {model = GetHashKey('police3'), job = {"police"}},
	[4] = {model = GetHashKey('police2'), job = {"police"}},
    [5] = {model = GetHashKey('as350'), job = {"police"}},
    [6] = {model = GetHashKey('20ramambo'), job = {"ambulance"}},
    [7] = {model = GetHashKey('dodgeems'), job = {"ambulance"}},
    --[8] = {model = GetHashKey('model_vehicle'), job = {"name_job"}},
}
