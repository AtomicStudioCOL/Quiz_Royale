--[[
    

    --]]

--!Type(ClientAndServer)
-- modules --
local gameManager = require("GameManager")

-- local variables --
local _spawnerPoints = gameManager.spawnerPoints
local tapHandlers = gameManager.tapHandlers
local _roomsUi = nil
local _questionsUI = nil
local _dialoguesUI = nil

-- events --
local testEvent = Event.new("testEvent")
-- functions --

-- event functions --
function self:ClientAwake()
    -- sets scripts
    _roomsUi = gameManager.uiManager:GetComponent("roomsUi")
    
    _questionsUI = gameManager.uiManager:GetComponent("QuestionUi")
    _dialoguesUI = gameManager.uiManager:GetComponent("Dialogues")
    questionPool = gameManager.uiManager:GetComponent("QuestionPool")

    -- sets tap handlers
    tapHandlers["travel"].Tapped:Connect(function()
        _roomsUi.enabled = true
    end)

    tapHandlers["kpop"].Tapped:Connect(function()
        _roomsUi.enabled = true
    end)
    
    tapHandlers["cat"].Tapped:Connect(function()
        _roomsUi.enabled = true
    end)

    for i, v in pairs(tapHandlers["travelQuiz"]) do
        v.Tapped:Connect(function()
            _questionsUI.enabled = true
            _dialoguesUI.enabled = true
            _questionsUI.welcomePlayer("travel")
            _dialoguesUI.welcomePlayerDialogues("travel")
            gameManager.newPlayerEnteredQuiz:FireServer("travel")
        end)
    end

    for i, v in pairs(tapHandlers["catQuizz"]) do
        v.Tapped:Connect(function()
            _questionsUI.enabled = true
            _dialoguesUI.enabled = true
            _questionsUI.welcomePlayer("cat")
            _dialoguesUI.welcomePlayerDialogues("cat")
            gameManager.newPlayerEnteredQuiz:FireServer("cat")
        end)
    end

    -- sets other events
    gameManager.changeRoomClient:Connect(function(player : Player, destination : string)
        player.character:Teleport(_spawnerPoints[destination].transform.position, function()end)
    end)

    -- spawns player in given position
    client.PlayerConnected:Connect(function(player : Player)
        player.CharacterChanged:Connect(function()
            player.character:Teleport(_spawnerPoints["travel"].transform.position, function() end)
        end)
    end)
end