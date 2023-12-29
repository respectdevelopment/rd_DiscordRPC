local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = 0

Citizen.CreateThread(function()
    while true do
        DiscordStatus()

        if rd.Template.AllowFPScounter then
            curtime = GetGameTimer()
            curframes = GetFrameCount()       
                  
            if((curtime - prevtime) > 1000) then
                fps = (curframes - prevframes) - 0                
                prevtime = curtime
                prevframes = curframes
            end      
            Wait(350)
        end

        local OnlinePlayers = GetActivePlayers()
        local id = GetPlayerServerId(PlayerId())
        local Player = GetPlayerName(PlayerId())
        local slots = GetConvarInt("sv_maxClients", 48)
        local fps = fps

        local template = rd.Template.Text

        local replacements = {
            ["{Players}"] = #OnlinePlayers .. "/" .. slots,
            ["{ID}"] = id,
            ["{PlayerName}"] = Player,
            ["{FPS}"] = fps,
            ["{Location}"] = Location,
        }

        local pattern = "{(.-)}"
        local result = template:gsub(pattern, function(key)
            return replacements['{' .. key .. '}'] or key
        end)

        SetRichPresence(result)

        Citizen.Wait(rd.UpdateTime)
    end
end)

function DiscordStatus()
    
    SetDiscordAppId(rd.DiscordApplicationID)

    SetDiscordRichPresenceAsset(rd.BigAsset.ID)
    SetDiscordRichPresenceAssetText(rd.BigAsset.Text)

    SetDiscordRichPresenceAssetSmall(rd.SmallAsset.ID)
    SetDiscordRichPresenceAssetSmallText(rd.SmallAsset.Text)

    if rd.FirstButton.Enabled then
        SetDiscordRichPresenceAction(0, rd.FirstButton.Text, rd.FirstButton.Link)
    end
    
    if rd.SecondButton.Enabled then
        SetDiscordRichPresenceAction(1, rd.SecondButton.Text, rd.SecondButton.Link)
    end

end




