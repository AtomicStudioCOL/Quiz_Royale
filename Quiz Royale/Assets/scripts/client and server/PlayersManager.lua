--!Type(ClientAndServer)
-- modules --
local gameManager = require("GameManager")

-- local variables --
local spawnerPoints = gameManager.spawnerPoints
local tapHandlers = gameManager.tapHandlers
local roomsUi = nil

-- events --
local testEvent = Event.new("testEvent")
-- functions --

-- event functions --
function self:ClientAwake()
    -- set client's game
    roomsUi = gameManager.uiManager:GetComponent("roomsUi")

    -- sets events
    tapHandlers["travel"].Tapped:Connect(function()
        roomsUi.enabled = true
    end)

    gameManager.changeRoomClient:Connect(function(destination : string)
        print(`{spawnerPoints[destination]}`)
        client.localPlayer.character:Teleport(spawnerPoints[destination].transform.position, function() end)
    end)

    -- spawns player in given position
    client.PlayerConnected:Connect(function(player : Player)
        player.CharacterChanged:Connect(function()
            player.character:Teleport(spawnerPoints["travel"].transform.position, function() end)
            print("Player " .. player.name .. " spawned in " .. tostring(spawnerPoints["travel"]))
        end)
    end)
end