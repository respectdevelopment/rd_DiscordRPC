SetConvarReplicated("sv_maxclients", "true")

PerformHttpRequest("https://raw.githubusercontent.com//respectdevelopment/versions/master/DiscordRPC", function(err, text, headers)

    if text then

        local ScriptVersion = GetResourceMetadata(GetCurrentResourceName(), "version")

        if ScriptVersion == text then
            print("^2[INFO] rd_DiscordRPC have latest version! ("..ScriptVersion..")^7")
        else
            print("^3[UPDATE] Update for rd_DiscordRPC is avaible! ("..ScriptVersion.. " -> " ..text.. ")^7")
            print("^3[UPDATE] https://github.com/respectdevelopment/rd_DiscordRPC^7")
        end

    else

        print("^1[ERROR] ^7Problem with API.")

    end
end)