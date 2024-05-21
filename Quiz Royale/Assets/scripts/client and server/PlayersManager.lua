--!Type(ClientAndServer)
-- modules --
local gameManager = require("GameManager")

-- local variables --
local spawnerPoints = gameManager.spawnerPoints
local tapHandlers = gameManager.tapHandlers
local roomsUi = nil
local questionsUI = nil

-- events --
local testEvent = Event.new("testEvent")
-- functions --

-- event functions --
function self:ClientAwake()
    -- sets scripts
    roomsUi = gameManager.uiManager:GetComponent("roomsUi")
    questionsUI = gameManager.uiManager:GetComponent("QuestionUi")
    questionPool = gameManager.uiManager:GetComponent("QuestionPool")

    -- sets tap handlers
    tapHandlers["travel"].Tapped:Connect(function()
        roomsUi.enabled = true
    end)

    tapHandlers["kpop"].Tapped:Connect(function()
        roomsUi.enabled = true
    end)

    tapHandlers["travelQuiz"].Tapped:Connect(function()
        questionsUI.enabled = true
        questionsUI.pickRandomQuestion(questionPool.testCategory.easy)
    end)

    -- sets other events
    gameManager.changeRoomClient:Connect(function(player : Player, destination : string)
        player.character:Teleport(spawnerPoints[destination].transform.position, function()end)
    end)

    -- spawns player in given position
    client.PlayerConnected:Connect(function(player : Player)
        player.CharacterChanged:Connect(function()
            player.character:Teleport(spawnerPoints["travel"].transform.position, function() end)
            print("Player " .. player.name .. " spawned in " .. tostring(spawnerPoints["travel"]))
        end)
    end)
end