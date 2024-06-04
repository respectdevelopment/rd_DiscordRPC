Config = {}

Config.Framework = "esx" -- ["esx" / "qb"]
Config.ApplicationID = 1193592918515138732 -- https://discord.com/developers/applications

-- Function = ["{ServerPlayers} / "{PlayerID}" / "{PlayerName}" / {"Health"} / "{Armour}" / "{Street}" / "{Area}" / "{fps}"]
-- Framework = ["{FirstName}" / "{LastName}" / "{Job}" / "{DateOfBirth}"] 

Config.Text = '{PlayerName}, {fps}fps | ID: {PlayerID}'


Config.Assets = {


    BigAsset = {
        ID = 'respectdevelopment_big', -- Big asset ID for name in the discord developer portal
        Text = 'discord.gg/4TvVtJ8Yhk' -- Big asset text (showed in the discord)
    },
    
    SmallAsset = {
        ID = 'respectdevelopment_small', -- Small asset ID for name in the discord developer portal
        Text = 'Respect Development' -- Small asset text (showed in the discord)
    }

}

Config.Buttons = {

    FirstButton = {

        Enabled = true,
        Text = 'Discord', 
        Link = 'https://discord.gg/aPjh2APfzH' 

    },
    
    SecondButton = {

        Enabled = true,
        Text = 'Github', 
        Link = 'https://github.com/respectdevelopment' 

    }

}

