local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = 0

Citizen.CreateThread(function()
    while true do
        DiscordStatus()

        if rd.Template.FPS then
            CreateThread(function()
                while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
                    Wait(500)
                    prevframes = GetFrameCount()
                    prevtime = GetGameTimer()            
                end
              
                while true do         
                  curtime = GetGameTimer()
                    curframes = GetFrameCount()       
                      
                    if((curtime - prevtime) > 1000) then
                        fps = (curframes - prevframes) - 0                
                        prevtime = curtime
                        prevframes = curframes
                    end      
                  Wait(350)
                end    
            end)
        end

        Citizen.Wait(rd.UpdateTime)
    end
end)



RegisterNetEvent("RespectDevelopment:DiscordRPC:ReciveUserData", function(result)
    SetRichPresence(result)
    if rd.Debug then
        local result = result
        print("[DEBUG] Received data from server side to client side.")
        print("[DEBUG] Results: " ..result.. "")
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

    if rd.Debug then
        print("[DEBUG] Requesting data from client side to server side.")
    end

    TriggerServerEvent('RespectDevelopment:DiscordRPC:GetUserData', fps, Location)
end

