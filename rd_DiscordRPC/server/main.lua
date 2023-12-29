RegisterNetEvent('RespectDevelopment:DiscordRPC:GetUserData', function(fps, Location)
    local OnlinePlayers = GetPlayers()
    local PlayerID = GetPlayerName(source)
    local slots = GetConvarInt("sv_maxClients", 48)
    local template = rd.Template.Text
    local fps = fps
    local Location = Location

    local replacements = {
        ["{Players}"] = #OnlinePlayers .. "/" .. slots,
        ["{ID}"] = source,
        ["{PlayerName}"] = PlayerID,
        ["{FPS}"] = fps,
        ["{Location}"] = Location,
    }

    if rd.Debug then
        print("")
        print("[DEBUG] Loading data from client side do server side.")
        print("[DEBUG] Data loaded!")
        print("")
    end

    local pattern = "{(.-)}"
    local result = template:gsub(pattern, function(key)
        return replacements['{' .. key .. '}'] or key
    end)

    TriggerClientEvent('RespectDevelopment:DiscordRPC:ReciveUserData', source, result)

    if rd.Debug then
        print("")
        print("[DEBUG] Sending data from server side to client side")
        print("[DEBUG] Data loaded!")
        print("")
    end
end)