Citizen.CreateThread(function()
    while true do
        Wait(7)

        local OnlinePlayers = GetActivePlayers()
        local id = GetPlayerServerId(PlayerId())
        local Player = GetPlayerName(PlayerId())

        local template = Config.Text

        local replacements = {
            ["{Players}"] = #OnlinePlayers .. "/" ..Config.ServerSlots,
            ["{ID}"] = id,
            ["{PlayerName}"] = Player,
        }

        local pattern = "{(.-)}"
        local result = template:gsub(pattern, function(key)
            return replacements['{' .. key .. '}'] or key
        end)


        DiscordStatus(result2, result3)
        SetRichPresence(result)
        Wait(Config.UpdateTime * 1000)
    end
end)


function DiscordStatus()
    
    SetDiscordAppId(Config.ApplicationID)


    SetDiscordRichPresenceAsset(Config.BigAsset.ID)
    SetDiscordRichPresenceAssetText(Config.BigAsset.Text)

    SetDiscordRichPresenceAssetSmall(Config.SmallAsset.ID)
    SetDiscordRichPresenceAssetSmallText(Config.SmallAsset.Text)

    if Config.FirstButton.Enabled then
        SetDiscordRichPresenceAction(0, Config.FirstButton.Text, Config.FirstButton.Link)
    end
    
    if Config.SecondButton.Enabled then
        SetDiscordRichPresenceAction(1, Config.SecondButton.Text, Config.SecondButton.Link)
    end

end
