rd = {}

rd.DiscordApplicationID = YourApplicationID
rd.UpdateTime = 60000 -- 60000 = 60 seconds

rd.Template = {
 
    Text = '{PlayerName} - {Players} | ID: {ID}',
    AllowFPScounter = false,

    -- {ID} = Show Player ID
    -- {PlayerName} = Show Player Name
    -- {Players} = Show Player Count/Show server max slots
    -- {FPS} = Show Player FPS !! MUST SET AllowFPScounter -> true
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