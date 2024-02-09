SetConvarReplicated("sv_maxclients", "true")

if Config.Updater then
    PerformHttpRequest("https://raw.githubusercontent.com//respectdevelopment/versions/master/DiscordRPC", function(err, Version, headers)

        local ScriptVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
    
        if GetResourceMetadata(GetCurrentResourceName(), "version") == Version then
            print("^2[INFO] rd_DiscordRPC have latest version!")
        else
            print("^3[UPDATE] Update for rd_DiscordRPC is avaible! ("..ScriptVersion.. " -> " ..Version..")")
            print("^3[UPDATE] https://github.com/respectdevelopment/rd_DiscordRPC")
        end
    end)
end