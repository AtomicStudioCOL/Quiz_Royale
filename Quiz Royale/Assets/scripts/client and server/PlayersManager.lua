--!Type(ClientAndServer)
-- modules --
local gameManager = require("GameManager")

-- local variables --

-- functions --

-- event functions --
function self:ClientAwake()
    client.PlayerConnected:Connect(function(player : Player)
        player.CharacterChanged:Connect(function()
            player.character:Teleport(gameManager.spawnerPoints["lobby"].transform.position, function() end)
            print("Player " .. player.name .. " spawned in " .. tostring(gameManager.spawnerPoints["lobby"]))
        end)
    end)
end