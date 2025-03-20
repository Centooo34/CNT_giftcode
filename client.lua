local codeused = 0

RegisterCommand(Config.Command, function()  -- edit command if necesary
    local input = lib.inputDialog("Gift Code", {
        {type = "input", label = Config.Menu.Input, placeholder = Config.Menu.Placeholder} --  edit this if you want
    })

    if input and input[1] then
        if codeused == 0 then
            TriggerServerEvent("giftcode:redeem", input[1])
            codeused = codeused + 1
        else
            print("You have already used a gift code!")
        end
    end
end)
