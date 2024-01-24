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
        
        local Slots = GetConvarInt("sv_maxClients", 48)
        local OnlinePlayers = GetActivePlayers()
        local id = GetPlayerServerId(PlayerId())
        local Player = GetPlayerName(PlayerId())
        local Street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true))))
        local Area = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true))))
        local Health = GetEntityHealth(PlayerPedId()) - 100


        if Config.Framework == "ESX" then
            local PlayerCharacterFirstName = ESX.PlayerData.firstName
            local PlayerCharacterLastName = ESX.PlayerData.lastName
            local PlayerCharacterJob = ESX.PlayerData.job.name
    
            local sex = ESX.PlayerData.sex
            local PlayerCharacterSex = sexx
    
            if sex == "m" then
                sexx = "Male"
            else 
                sexx = "Female"
            end
            
            local template = Config.Text
    
            local replacements = {
                ["{ServerPlayers}"] = #OnlinePlayers .. "/" ..Slots,
                ["{PlayerID}"] = id,
                ["{PlayerName}"] = Player,
                ["{PlayerCharacterFirstName}"] = PlayerCharacterFirstName,
                ["{PlayerCharacterLastName}"] = PlayerCharacterLastName,
                ["{PlayerCharacterSex}"] = PlayerCharacterSex,
                ["{PlayerCharacterJob}"] = PlayerCharacterJob,
                ["{PlayerCharacterStreet}"] = Street,
                ["{PlayerCharacterArea}"] = Area,
                ["{PlayerCharacterHealth}"] = Health,
            
            }
            
            local pattern = "{(.-)}"
            
            local result = template:gsub(pattern, function(key)
                return replacements['{' .. key .. '}'] or key
            end)
            
            
            DiscordStatus(result2, result3)
            SetRichPresence(result)

        elseif Config.Framework == "QBCORE" then

            local Data = QBCore.Functions.GetPlayerData()        

            local PlayerCharacterFirstName = Data.charinfo.firstname
            local PlayerCharacterLastName = Data.charinfo.lastname
            local PlayerCharacterJob = Data.job.label
    
            local sex = Data.charinfo.gender
            local PlayerCharacterSex = sexx
    
            if sex == 0 then
                sexx = "Male"
            else 
                sexx = "Female"
            end
            
            local template = Config.Text
    
            local replacements = {
                ["{ServerPlayers}"] = #OnlinePlayers .. "/" ..Slots,
                ["{PlayerID}"] = id,
                ["{PlayerName}"] = Player,
                ["{PlayerCharacterFirstName}"] = PlayerCharacterFirstName,
                ["{PlayerCharacterLastName}"] = PlayerCharacterLastName,
                ["{PlayerCharacterSex}"] = PlayerCharacterSex,
                ["{PlayerCharacterJob}"] = PlayerCharacterJob,
                ["{PlayerCharacterStreet}"] = Street,
                ["{PlayerCharacterArea}"] = Area,
                ["{PlayerCharacterHealth}"] = Health,
            
            }
            
            local pattern = "{(.-)}"
            
            local result = template:gsub(pattern, function(key)
                return replacements['{' .. key .. '}'] or key
            end)
            
            
            DiscordStatus(result2, result3)
            SetRichPresence(result)
        end
 
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
