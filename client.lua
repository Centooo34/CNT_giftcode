local codeused = 0

RegisterCommand("giftcode", function()
    local input = lib.inputDialog("Gift Code", {
        {type = "input", label = Config.Menu.Input, placeholder = Config.Menu.Placeholder}
    })

    if input and input[1] then
        if codeused == 0 then
            TriggerServerEvent("giftcode:redeem", input[1])
            codeused = codeused + 1
        elseif codeused > 1 then
            TriggerServerEvent('ox_lib:notify', source, {type = 'error', description = "You have already redeemed a gift code."})
        end
    end
end)
