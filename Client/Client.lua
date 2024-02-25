if Config.Framework == "ESX" then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "QBCORE" then
    QBCore = exports['qb-core']:GetCoreObject()
else
    print("[ERROR] Yout framework is not valid!")
end

Citizen.CreateThread(function()
    while true do
        Wait(Config.UpdateTime * 1000)

        if Config.Framework == "ESX" then

            local Gender = false
            local Health = false
        
            if ESX.PlayerData.sex == "m" then
                Gender = Config.Strings.Male
            else 
                Gender = Config.Strings.Female
            end

            if GetEntityHealth(PlayerPedId()) == 0 then
                Health = Config.Strings.Dead
            else
                Health = GetEntityHealth(PlayerPedId()) - 100
            end

            local job = Config.Strings.Loading

            if ESX.PlayerData.job ~= null then
                job = ESX.PlayerData.job.label
            end
  
            local replacements = {
                ["{ServerPlayers}"] = #GetActivePlayers() .. "/" ..GetConvarInt("sv_maxClients", 48),
                ["{PlayerID}"] = GetPlayerServerId(PlayerId()),
                ["{PlayerName}"] = GetPlayerName(PlayerId()),
                ["{PlayerCharacterFirstName}"] = ESX.PlayerData.firstName,
                ["{PlayerCharacterLastName}"] = ESX.PlayerData.lastName,
                ["{PlayerCharacterGender}"] = Gender,
                ["{PlayerCharacterJob}"] = job,
                ["{PlayerCharacterStreet}"] = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                ["{PlayerCharacterArea}"] = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                ["{PlayerCharacterHealth}"] = Health,
            
            }
                        
            local result = Config.Text:gsub("{(.-)}", function(key)
                return replacements['{' .. key .. '}'] or key
            end)

            DiscordStatus(result)
            

        elseif Config.Framework == "QBCORE" then

            local Data = QBCore.Functions.GetPlayerData()        
    
            local Gender = false
            local Health = false
    

            if Data.charinfo.gender == 0 then
                Gender = Config.Strings.Male
            else 
                Gender = Config.Strings.Female
            end

            if GetEntityHealth(PlayerPedId()) == 0 then
                Health = Config.Strings.Dead
            else
                Health = GetEntityHealth(PlayerPedId()) - 100
            end  
                
            local replacements = {
                ["{ServerPlayers}"] = #GetActivePlayers() .. "/" ..GetConvarInt("sv_maxClients", 48),
                ["{PlayerID}"] = GetPlayerServerId(PlayerId()),
                ["{PlayerName}"] = GetPlayerName(PlayerId()),
                ["{PlayerCharacterFirstName}"] = Data.charinfo.firstname,
                ["{PlayerCharacterLastName}"] = Data.charinfo.lastname,
                ["{PlayerCharacterGender}"] = Gender,
                ["{PlayerCharacterJob}"] = Data.job.label,
                ["{PlayerCharacterStreet}"] = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                ["{PlayerCharacterArea}"] = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                ["{PlayerCharacterHealth}"] = Health,
            
            }
                        
            local result = Config.Text:gsub("{(.-)}", function(key)
                return replacements['{' .. key .. '}'] or key
            end)
            
            DiscordStatus(result)
        end
 
    end
end)

function DiscordStatus(result)

    SetRichPresence(result)

    SetDiscordAppId(Config.ApplicationID)
    SetDiscordRichPresenceAsset(Config.Assets.BigAsset.ID)
    SetDiscordRichPresenceAssetText(Config.Assets.BigAsset.Text)
    SetDiscordRichPresenceAssetSmall(Config.Assets.SmallAsset.ID)
    SetDiscordRichPresenceAssetSmallText(Config.Assets.SmallAsset.Text)

    if Config.Buttons.FirstButton.Enabled then
        SetDiscordRichPresenceAction(0, Config.Buttons.FirstButton.Text, Config.Buttons.FirstButton.Link)
    end
    
    if Config.Buttons.SecondButton.Enabled then
        SetDiscordRichPresenceAction(1, Config.Buttons.SecondButton.Text, Config.Buttons.SecondButton.Link)
    end
end
