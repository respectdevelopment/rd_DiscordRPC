Config = {}

Config.Framework = "ESX" -- ESX/QBCORE

Config.ApplicationID = 1193592918515138732 -- Your Application Id
Config.UpdateTime = 60

Updater = true

-- SERVER
-- {ServerPlayers} : Show count all conected players

-- PLAYER
-- {PlayerID} : Show Player ID
-- {PlayerName} : Show Player NAME

-- CHARACTER
-- {PlayerCharacterFirstName} : Show Player Character First Name
-- {PlayerCharacterLastName} : Show Player Character Last Name
-- {PlayerCharacterGender} : Show Player Character Sex (Male/Female)
-- {PlayerCharacterJob} : Show Player Character Job
-- {PlayerCharacterHealth} : Show Player Character Health
-- {PlayerCharacterStreet} = Show name of the street where the player is currently located (Bridge Street, ...)
-- {PlayerCharacterArea} = Show name of the area where the player is currently located (East Vinevwood, ...)

Config.Text = '{PlayerName} - {ServerPlayers} | ID: {PlayerID}'

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

Config.Strings = {

    Male = "Male",
    Female = "Female",
    Dead = "Dead",
    Loading = "Loading.."

}
