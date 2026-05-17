local cooldown = {}

local hinnat = {
    panto = 500,
    bmx = 250,
    sanchez = 750
}

RegisterNetEvent('kaatu:ostaAuto')
AddEventHandler('kaatu:ostaAuto', function(auto)
    local hinta = hinnat[auto]
    if not hinta then return end

local rahat = exports.ox_inventory:GetItemCount(source, 'money')

if cooldown [source] and os.time() - cooldown[source] < 180 then -- 180 = sekuntia/seconds
    TriggerClientEvent('kaatu:notify', source, 'Cooldown')
    return
end

if rahat >= hinta then

exports.ox_inventory:RemoveItem(source, 'money', hinta)

TriggerClientEvent('kaatu:spawnAuto', source, auto)
 cooldown[source] = os.time()

else
TriggerClientEvent('kaatu:notify', source, 'Ei tarpeeksi rahaa!')
    
end
end)