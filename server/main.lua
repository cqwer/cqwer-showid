onlinePlayers = {}

RegisterServerEvent('cqwer-showid:add-id')
AddEventHandler('cqwer-showid:add-id', function()
    TriggerClientEvent("cqwer-showid:client:add-id", source, onlinePlayers)
    local topText = "undefined " .. cqwer.which
    local identifiers = GetPlayerIdentifiers(source)
    if cqwer.which == "steam" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = v
                break
            end
        end
    elseif cqwer.which == "steamv2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = string.sub(v, 7)
                break
            end
        end
    elseif cqwer.which == "license" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = v
                break
            end
        end
    elseif cqwer.which == "licensev2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = string.sub(v, 9)
                break
            end
        end
    elseif cqwer.which == "name" then 
        topText = GetPlayerName(source)
    end
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("cqwer-showid:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)