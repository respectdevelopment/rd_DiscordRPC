rd = {}

rd.DiscordApplicationID = YourApplicationID
rd.UpdateTime = 1000 -- 60000 = 60 seconds
rd.Debug = false

rd.Template = {
 
    Text = '{PlayerName} - {Players} | ID: {ID}',

    
    -- Turn on/off "placeholders" for more optimalization (disable unused function)
    ID = true, -- {ID} = Show player ID 
    PlayerName = true, -- {PlayerName} = Show Player name 
    Players = true, -- {Players} = Show active player count/max slots
    FPS = false, -- {FPS} = Show player FPS (After join, you need wait to UpdateTime to update the fps! Default fps is 0.)

}

rd.BigAsset = {

    ID = 'respectdevelopment_big', -- Big asset ID for name in the discord developer portal
    Text = 'Respect Development' -- Big asset text (showed in the discord)

}

rd.SmallAsset = {

    ID = 'respectdevelopment_small', -- Small asset ID for name in the discord developer portal
    Text = 'Respect Development' -- Small asset text (showed in the discord)

}

rd.FirstButton = {

    Enabled = true,
    Text = 'Discord', -- First button link
    Link = 'https://discord.gg/aPjh2APfzH' -- Second button link
}

rd.SecondButton = {

    Enabled = false,
    Text = 'Github', -- Second button text
    Link = 'https://discord.gg/aPjh2APfzH' -- Second button link

}