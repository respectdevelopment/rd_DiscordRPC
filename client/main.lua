local loaded = false


if Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded',function(xPlayer)
        ESX.PlayerData = xPlayer
        loaded = true
    end)

elseif Config.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        loaded = true
    end)
end


Citizen.CreateThread(function()
    while true do

        if Config.Framework == "esx" then

            if loaded then
                    
                local replacements = {
                    ["{ServerPlayers}"] = #GetActivePlayers() .. "/" ..GetConvarInt("sv_maxClients", 48),
                    ["{PlayerID}"] = GetPlayerServerId(PlayerId()),
                    ["{PlayerName}"] = GetPlayerName(PlayerId()),
                    ["{FirstName}"] = ESX.PlayerData.firstName,
                    ["{LastName}"] = ESX.PlayerData.lastName,
                    ["{Job}"] = ESX.PlayerData.job.label,
                    ["{DateOfBirth}"] = ESX.PlayerData.dateofbirth,
                    ["{Health}"] = GetEntityHealth(PlayerPedId()),
                    ["{Armour}"] = GetPedArmour(PlayerPedId()),
                    ["{Street}"] = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                    ["{Area}"] = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                    ["{fps}"] = math.floor(1.0 / GetFrameTime())
                }
                     
                local result = Config.Text:gsub("{(.-)}", function(key)
                    return replacements['{' .. key .. '}'] or key
                end)
                
                DiscordStatus(result)

            else

                DiscordStatus("Loading..")

            end

        elseif Config.Framework == "qb" then

            if loaded then

                local replacements = {
                    ["{ServerPlayers}"] = #GetActivePlayers() .. "/" ..GetConvarInt("sv_maxClients", 48),
                    ["{PlayerID}"] = GetPlayerServerId(PlayerId()),
                    ["{PlayerName}"] = GetPlayerName(PlayerId()),
                    ["{FirstName}"] = QBCore.Functions.GetPlayerData().charinfo.firstname,
                    ["{LastName}"] = QBCore.Functions.GetPlayerData().charinfo.lastname,
                    ["{Job}"] = QBCore.Functions.GetPlayerData().job.label,
                    ["{DateOfBirth}"] = QBCore.Functions.GetPlayerData().charinfo.birthdate,
                    ["{Health}"] = GetEntityHealth(PlayerPedId()),
                    ["{Armour}"] = GetPedArmour(PlayerPedId()),
                    ["{Street}"] = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                    ["{Area}"] = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true)))),
                    ["{fps}"] = math.floor(1.0 / GetFrameTime())
                }
                     
                local result = Config.Text:gsub("{(.-)}", function(key)
                    return replacements['{' .. key .. '}'] or key
                end)
                
                DiscordStatus(result)

            else

                DiscordStatus("Loading..")

            end
    
        end

        Citizen.Wait(60000)  
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
