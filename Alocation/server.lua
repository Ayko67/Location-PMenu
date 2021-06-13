ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Ayko:Blista')
AddEventHandler('Ayko:Blista', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 300
    xPlayer.removeMoney(300)
end)

RegisterNetEvent('Ayko:Faggio')
AddEventHandler('Ayko:Faggio', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 200
    xPlayer.removeMoney(200)
end)

RegisterNetEvent('Ayko:Bmx')
AddEventHandler('Ayko:Bmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    xPlayer.removeMoney(25)
end)

------------------------------------------------------ BY Ayko#6666 ------------------------------------------------------