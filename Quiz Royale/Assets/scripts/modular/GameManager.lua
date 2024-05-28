--!Type(Module)
-- required scripts --

-- serialized variables --
--!Header("Managers")
--!SerializeField
local uiManagerGo : GameObject = nil

--!Header("Spawners")
--!SerializeField
local travelSpawner : GameObject = nil
--!SerializeField
local kpopSpawner : GameObject = nil
--!SerializeField
local catCoffeSpawner : GameObject = nil

--!Header("Teleport Tap Handlers")
--!SerializeField
local travelTapH : TapHandler = nil
--!SerializeField
local kpopTapH : TapHandler = nil
--!SerializeField
local catCoffeTapH : TapHandler = nil

-- Select Portal 
--!Header("Activate Quizz Tap Handlers")
--!SerializeField
local travelQuizTapH : TapHandler = nil
--!SerializeField
local catCoffeQuizTapH : TapHandler = nil

-- global variables --
playersInGame = {}
spawnerPoints = {}
tapHandlers = {}
uiManager = nil
questionPool = require("QuestionPool")

scorePlayer = {}
playersInTravelQ = {}
playersInKpopQ = {}
playersInCatQ = {}

testAsked = {}
travelQAsked = {}
kpopQAsked = {}
catQAsked = {}

-- events --
changeRoomServer = Event.new("changeRoomServer")
changeRoomClient = Event.new("changeRoomClient")

finishGame = Event.new("finishGame")
newPlayerEnteredQuiz = Event.new("newPlayerEnteredQuiz")
nextQuestion = Event.new("nextQuestion")
replicateChosenQuestion = Event.new("replicateRandomQuestion")
saveScorePlayer = Event.new("saveScorePlayer")

-- local variables --

-- functions --
function tableLenght(table)
    local lenght = 0
	for k, v in pairs(table) do
		lenght += 1
	end
	return lenght
end

function normalizeTable(table)
    local returnedTable = {}
    local index = 0

    for k, v in table do
        index += 1
        returnedTable[index] = v
    end

    return returnedTable
end

function shuffleAnswers(answers)
    local shuffled = {a = nil, b = nil, c = nil, d = nil}

    local optionsToAssign = 4

    local array = {"a", "b", "c", "d"}

    for k, v in pairs(answers) do
        local randomNumber = math.random(1, tableLenght(array))

        shuffled[k] = answers[table.remove(array, randomNumber)]
    end

    return shuffled
end

function pickRandomQuestion(questionsAsked, category)
    local categoryDifficulty = nil
    local numberAsked = tableLenght(questionsAsked)
    local tableOfPlayers
    local pickedQuestion = nil
    local diff
    
    if category == "testCategory" then
        tableOfPlayers = playersInTravelQ
    end
    
    if numberAsked < 6 then
        categoryDifficulty = questionPool[category].easy
        diff = "e"
    elseif numberAsked < 11 then
        categoryDifficulty = questionPool[category].normal
        diff = "n"
    elseif numberAsked < 16 then
        categoryDifficulty = questionPool[category].hard
        diff = "h"
    else
        for k, player in pairs(tableOfPlayers) do
            finishGame:FireClient(player)
        end
        return
    end

    print(`{numberAsked}`)

    local numberOfQuestions = tableLenght(categoryDifficulty)

    local randomNumber
    local questionWasAsked = true

    while questionWasAsked == true do
        randomNumber = math.random(1, numberOfQuestions)
        pickedQuestion = categoryDifficulty[randomNumber]
        questionWasAsked = pickedQuestion.asked
    end

    pickedQuestion.asked = true
    questionsAsked[diff ..  `{randomNumber}`] = randomNumber 

    for k, player in pairs(tableOfPlayers) do
        replicateChosenQuestion:FireClient(player, pickedQuestion)
    end

    Timer.After(20, function()
        pickRandomQuestion(questionsAsked, category)
    end)
end


function self:ClientAwake()
    -- setting spawner points
    spawnerPoints["travel"] = travelSpawner
    spawnerPoints["kpop"] = kpopSpawner
    spawnerPoints["catCoffe"] = catCoffeSpawner

    -- setting tap handlers
    tapHandlers["travel"] = travelTapH
    tapHandlers["kpop"] = kpopTapH
    tapHandlers["catCoffe"] = catCoffeTapH

    -- tap handlers Quizz
    tapHandlers["travelQuiz"] = travelQuizTapH
    tapHandlers["catCoffeQuiz"] = travelQuizTapH

    -- setting other managers and scripts
    uiManager = uiManagerGo
    questionPool = uiManager:GetComponent("QuestionPool")
end

function self:ServerAwake()
    -- events --
    changeRoomServer:Connect(function(player : Player, destination : string)
        changeRoomClient:FireAllClients(player, destination)
        --saveScorePlayer:FireAllClients(scorePlayer)
    end)

    newPlayerEnteredQuiz:Connect(function(player : Player, quiz : string)
        if quiz == "travel" then
            playersInTravelQ[player.name] = player
            if tableLenght(playersInTravelQ) > 1 then
                Timer.After(6, function() pickRandomQuestion(testAsked, "testCategory") end)
            end
        elseif quiz == "kpop" then
            playersInKpopQ[player.name] = player
        elseif quiz == "cat" then
            playersInCatQ[player.name] = player
        end
    end)

    nextQuestion:Connect(function(player, category)
        local questionsAsked
        if category == "testCategory" then
            questionsAsked = testAsked
        end
        pickRandomQuestion(questionsAsked, category)
    end)
end

-- events --
scene.PlayerJoined:Connect(function(scene, player : Player)
    player.CharacterChanged:Connect(function()
        playersInGame[player.name] = player.character.gameObject
     end)
end)

