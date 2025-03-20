local codeused = 0

RegisterCommand("giftcode", function()
    local input = lib.inputDialog("Gift Code", {
        {type = "input", label = "Enter the gift code", placeholder = "Here"}
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
