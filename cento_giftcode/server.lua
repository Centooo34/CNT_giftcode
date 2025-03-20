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
