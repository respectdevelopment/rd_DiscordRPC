if Config.UpdateCheck then
    
    CreateThread(function()
        PerformHttpRequest("https://raw.githubusercontent.com//respectdevelopment/rd_DiscordRPC/master/version", VersionCheck, "GET")
    end)

    function VersionCheck(err, ResponseVersion, headers)
        local Version = LoadResourceFile(GetCurrentResourceName(), "version")
        
        if Version == ResponseVersion then
            print("^2[INFO] DiscordRPC have latest version!")
        else
            print("\n^1----------------------------------------------------------------------------------^7")
            print("^5DiscordRPC\n\n^0Latest version is: ^2"..ResponseVersion.."\n^7Your version: ^1"..Version.."^7\n\nUpdate from: ^5https://github.com/respectdevelopment/rd_DiscordRPC")
            print("^1----------------------------------------------------------------------------------^7")
        end
    end
end