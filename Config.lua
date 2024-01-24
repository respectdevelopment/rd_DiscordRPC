Config = {

    Framework = "ESX", -- ESX/QBCORE : Used for character name : With standlone your character name options will not work!
    ApplicationID = 1193592918515138732, -- Your Application Id (Join discord if you dont know how to change)
    UpdateTime = 60, -- In Seconds (For best optimalization keep 60 seconds.)

    UpdateCheck = true,

    -- SERVER
    -- {ServerPlayers} : Show count all conected players

    -- PLAYER
    -- {PlayerID} : Show Player ID
    -- {PlayerName} : Show Player NAME

    -- CHARACTER
    -- {PlayerCharacterFirstName} : Show Player Character First Name
    -- {PlayerCharacterLastName} : Show Player Character Last Name
    -- {PlayerCharacterSex} : Show Player Character Sex (Male/Female)
    -- {PlayerCharacterJob} : Show Player Character Job
    -- {PlayerCharacterHealth} : Show Player Character Health

    -- {PlayerCharacterStreet} = Show name of the street where the player is currently located (Bridge Street, ...)
    -- {PlayerCharacterArea} = Show name of the area where the player is currently located (East Vinevwood, ...)

    Text = '{PlayerName} - {ServerPlayers} | ID: {PlayerID}',

    BigAsset = {
        ID = 'respectdevelopment_big', -- Big asset ID for name in the discord developer portal
        Text = 'discord.gg/4TvVtJ8Yhk' -- Big asset text (showed in the discord)
    },

    SmallAsset = {
        ID = 'respectdevelopment_small', -- Small asset ID for name in the discord developer portal
        Text = 'Respect Development' -- Small asset text (showed in the discord)
    },

    FirstButton = {
        Enabled = true,
        Text = 'Discord', -- First button link
        Link = 'https://discord.gg/aPjh2APfzH' -- Second button link
    },

    SecondButton = {
        Enabled = false,
        Text = 'Github', -- Second button text
        Link = 'https://discord.gg/aPjh2APfzH' -- Second button link
    }
}
