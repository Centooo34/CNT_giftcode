local codeused = 0

RegisterCommand("giftcode", function()  -- edit command if necesary
    local input = lib.inputDialog("Gift Code", {
        {type = "input", label = "Enter the gift code", placeholder = "Here"} --  edit this if you want
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
