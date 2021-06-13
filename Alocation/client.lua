ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(80000)
  end
end)



local Alocation = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Location" },
	Data = { currentMenu = "By Ayko#6666", "Location" },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result)

            if btn.name == "Faggio" then
                TriggerServerEvent('Ayko:Faggio')

                ESX.ShowNotification('Vous avez payez ~r~200$')

                Citizen.Wait(1)
                spawnCar("faggio")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Scooter ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
				CloseMenu(true)
            end

            if btn.name == "Blista" then
                TriggerServerEvent('Ayko:Blista')

                ESX.ShowNotification('Vous avez payez ~r~300$')

                Citizen.Wait(1)
				spawnCar("blista")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Véhicule ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
				CloseMenu(true)
            end
                
            if btn.name == "Bmx" then
                TriggerServerEvent('Ayko:Bmx')

                ESX.ShowNotification('Vous avez payez ~r~25$')
                Citizen.Wait(1)
                spawnCar("bmx")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Vélo ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
				CloseMenu(true)
            end

            if btn.name == "Louer un Véhicule" then
                OpenMenu("Louer un Véhicule")
            end

            end,
    },

	Menu = {
		["By Ayko#6666"] = {
			b = {
                {name = "Louer un Véhicule", ask = "~r~→→→", askX = true},
			}
		},

        ["Louer un Véhicule"] = {
			b = {
                {name = "Blista", ask = "~g~300$", askX = true},
                {name = "Faggio", ask = "~g~200$", askX = true},
                {name = "Bmx", ask = "~g~25$", askX = true},
			}
		}
	}
}

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
	local vehicle = CreateVehicle(car, -1033.58, -2729.02, 20.1, 241.51, true, false)
  
    
    SetEntityAsNoLongerNeeded(vehicle)
	SetModelAsNoLongerNeeded(vehicleName) 

	SetVehicleNumberPlateText(vehicle, "Location")
        
end

local position = {
    {x = -1034.78, y = -2732.76, z = 20.17}
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler ~r~au vendeur.")
				if IsControlJustPressed(1,51) then 					
                    CreateMenu(Alocation) 
				end
            end
        end
    end  
end)

Citizen.CreateThread(function()

    for k in pairs(position) do

	local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)

	SetBlipSprite(blip, 205)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Location")
    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_taostranslator")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "ig_taostranslator", -1034.49, -2732.1, 19.17, 145.64, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true) -- Le rend invincible
end)


------------------------------------------------------ BY Ayko#6666 ------------------------------------------------------