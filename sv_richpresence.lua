local discord = require 'discord'

-- Replace with your actual Discord Client ID
local CLIENT_ID = 'YOUR_DISCORD_CLIENT_ID'

-- Function to update Discord Rich Presence
local function updateRichPresence()
    local playerCount = GetNumPlayerIndices() -- Example of getting player count
    local presence = {
        state = "Playing on My Server", -- Change to your desired state
        details = "Players: " .. playerCount, -- Change to your desired details
        large_image = "large_image_key", -- Place your large image key here
        small_image = "small_image_key", -- Place your small image key here
        buttons = {
            {label = "Join Server", url = "https://your-server-url.com"}, -- URL for Join Server button
            {label = "Website", url = "https://your-website.com"} -- URL for additional button
        }
    }

    -- Update the presence
    discord.updatePresence(presence)
end

-- Initialize Discord RPC
discord.initialize(CLIENT_ID)

-- Update the rich presence every 15 seconds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000) -- Update every 15 seconds
        updateRichPresence()
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        discord.shutdown()
    end
end)