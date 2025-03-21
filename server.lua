ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("giftcode:redeem")
AddEventHandler("giftcode:redeem", function(code)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local reward = Config.GiftCodes[code]
    
    if not reward then
            TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = Config.Notify.Failure})
        return
    end
    

    if xPlayer.get("usedGiftCode") then
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = "You have already redeemed a gift code."})  -- edit this message if u want
        return
    end

    exports.ox_inventory:AddItem(source, reward.item, reward.count)
        
    TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = Config.Notify.Success})

    xPlayer.set("usedGiftCode", true) 
end)


-- version check
Citizen.CreateThread(function()
    local resourceName = GetCurrentResourceName()
    local currentVersion = GetResourceMetadata(resourceName, "version")

    PerformHttpRequest("https://raw.githubusercontent.com/Centooo34/cento_giftcode/main/version.txt", function(statusCode, newVersion, headers)
        if statusCode == 200 then
            newVersion = newVersion:gsub("\n", "")
            if currentVersion ~= newVersion then
                print("^1[WARNING] Your version " .. resourceName .. " (" .. currentVersion .. ") is old! Newest version is " .. newVersion .. ". Download newest version from https://github.com/Centooo34/cento_giftcode/releases.^0")
            else
                print("^2[INFO] " .. resourceName .. " is up fo date!^0")
            end
        else
            print("^3[WARNING] Failed to check version of script " .. resourceName .. ".^0")
        end
    end, "GET", "", {})
end)
