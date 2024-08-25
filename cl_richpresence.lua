-- Example of client-side script to trigger rich presence updates
RegisterNetEvent('updateRichPresence')
AddEventHandler('updateRichPresence', function()
    TriggerServerEvent('updateRichPresence')
end)

-- Example command to update presence
RegisterCommand('updatePresence', function()
    TriggerEvent('updateRichPresence')
end, false)