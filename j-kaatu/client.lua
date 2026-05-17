RegisterCommand('kaatu', function()   

    lib.showContext('kaatu_menu')

end)

RegisterNetEvent('kaatu:notify')
AddEventHandler('kaatu:notify', function(message)
lib.notify({ title = message, type = 'error' })
end)


RegisterNetEvent('kaatu:spawnAuto', function(auto)
    local ped = PlayerPedId()
local coords = GetEntityCoords(ped)
local heading = GetEntityHeading(ped)
RequestModel(auto)
while not HasModelLoaded(auto) do
    Citizen.Wait(0)
end
local vehicle = CreateVehicle(auto, coords.x, coords.y, coords.z, heading, false, false)
SetPedIntoVehicle(ped, vehicle, -1)

end)

AddEventHandler('spawn_panto', function()
TriggerServerEvent('kaatu:ostaAuto', 'panto', 500)
end)

AddEventHandler('spawn_bmx', function()
TriggerServerEvent('kaatu:ostaAuto', 'bmx', 250)
end)

AddEventHandler('spawn_sanchez', function()
TriggerServerEvent('kaatu:ostaAuto', 'sanchez', 750)
end)

lib.registerContext({
  id = 'kaatu_menu',
  title = 'Valikko',
  options = {
    {title = 'osta panto', event = 'spawn_panto', metadata = { {label = 'Hinta/price', value = '500$'} }, image = 'https://static.wikia.nocookie.net/gtawiki/images/a/ad/Panto-GTAV-front.png/revision/latest?cb=20190308222526' },
    {title = 'osta bmx', event = 'spawn_bmx', metadata = { {label = 'Hinta/price', value = '250$'} }, image = 'https://static.wikia.nocookie.net/gtawiki/images/6/64/BMX-GTAV-front.png/revision/latest/scale-to-width-down/268?cb=20161018175629'},
    {title = 'osta sanchez', event = 'spawn_sanchez', metadata = { {label = 'Hinta/price', value = '750$'} }, image = 'https://static.wikia.nocookie.net/gtawiki/images/4/46/Sanchez-GTAV-front-Sprunk.png/revision/latest/scale-to-width-down/268?cb=20160222221309'},
  }
})