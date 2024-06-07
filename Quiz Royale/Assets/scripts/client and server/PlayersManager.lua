--!Type(ClientAndServer)
-- modules --
local gameManager = require("GameManager")

-- local variables --
local _spawnerPoints = gameManager.spawnerPoints
local tapHandlers = gameManager.tapHandlers
local _roomsUi = nil
local _questionsUI = nil
local _dialoguesUI = nil
local initialized = false

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
            gameManager.requestPlayersInQ:FireServer()
            gameManager.requestPlayersInQ:Connect(function(playersInQ)
                if playersInQ[client.localPlayer.name] ~= nil then return end
                _questionsUI.enabled = true
                _dialoguesUI.enabled = true
                _questionsUI.welcomePlayer("travel")
                _dialoguesUI.welcomePlayerDialogues("travel")
                gameManager.newPlayerEnteredQuiz:FireServer("travel")
            end)
        end)
    end
    
    -- for i, v in pairs(tapHandlers["catQuizz"]) do
    --     v.Tapped:Connect(function()
    --         _questionsUI.enabled = true
    --         _dialoguesUI.enabled = true
    --         _questionsUI.welcomePlayer("cat")
    --         _dialoguesUI.welcomePlayerDialogues("cat")
    --         gameManager.newPlayerEnteredQuiz:FireServer("cat")
    --     end)
    -- end
    
    -- sets other events
    gameManager.changeRoomClient:Connect(function(player : Player, destination : string)
        player.character:Teleport(_spawnerPoints[destination].transform.position, function()end)
    end)
    
    -- spawns player in given position
    -- client.PlayerConnected:Connect(function(player : Player)
    --     player.CharacterChanged:Connect(function()
    --         gameManager.newPlayerEnteredQuiz:FireServer("travel")
    --     end)
    -- end)
    
    client.localPlayer.CharacterChanged:Connect(function(player : Player, character : Character)
        if character then 
            gameManager.newPlayerEnteredQuiz:FireServer("travel")
        end
    end)
    
    gameManager.setPlayersCurrentPos:Connect(function(player : Player, position)
        if player.name == client.localPlayer.name then return end
        player.character:Teleport(position, function() end)
    end)
    
    function initialize()
        if initialized then return end
        initialized = true
        _questionsUI.enabled = true
        _dialoguesUI.enabled = true
        _questionsUI.welcomePlayer("travel")
        _dialoguesUI.welcomePlayerDialogues("travel")
    end

    gameManager.newPlayerEnteredQuiz:Connect(function(player : Player, playersInQuizz : number)
        if playersInQuizz == 1 then
            player.character:Teleport(_spawnerPoints["travel"][1].transform.position, function() end)
        elseif playersInQuizz == 2 then
            player.character:Teleport(_spawnerPoints["travel"][2].transform.position, function() end)
        elseif playersInQuizz == 3 then
            player.character:Teleport(_spawnerPoints["travel"][3].transform.position, function() end)
        elseif playersInQuizz == 4 then
            player.character:Teleport(_spawnerPoints["travel"][4].transform.position, function() end)
        elseif playersInQuizz == 5 then
                player.character:Teleport(_spawnerPoints["travel"][5].transform.position, function() end)
        elseif playersInQuizz == 6 then
            player.character:Teleport(_spawnerPoints["travel"][6].transform.position, function() end)
        elseif playersInQuizz == 7 then
            player.character:Teleport(_spawnerPoints["travel"][7].transform.position, function() end)
        elseif playersInQuizz == 8 then
            player.character:Teleport(_spawnerPoints["travel"][8].transform.position, function() end)
        else
            player.character:Teleport(_spawnerPoints["travel"][1].transform.position, function() end)
        end
        gameManager.setPlayersCurrentPos:FireServer(client.localPlayer.character.transform.position)            
        initialize()
    end)
end

function self:ServerAwake()
    server.PlayerDisconnected:Connect(function(player : Player)
        gameManager.playerLeftQFunc(player, "travel")
    end)
end