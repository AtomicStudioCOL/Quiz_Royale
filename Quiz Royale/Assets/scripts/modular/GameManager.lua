--!Type(Module)
-- required scripts --

-- serialized variables --
--!Header("Managers")
--!SerializeField
local uiManagerGo : GameObject = nil

--!Header("Spawners")
--!SerializeField
local travelSpawner1 : GameObject = nil
--!SerializeField
local travelSpawner2 : GameObject = nil
--!SerializeField
local travelSpawner3 : GameObject = nil
--!SerializeField
local travelSpawner4 : GameObject = nil
--!SerializeField
local travelSpawner5 : GameObject = nil
--!SerializeField
local travelSpawner6 : GameObject = nil
--!SerializeField
local travelSpawner7 : GameObject = nil
--!SerializeField
local travelSpawner8 : GameObject = nil
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
local travelQuizTapH1 : TapHandler = nil
--!SerializeField
local travelQuizTapH2 : TapHandler = nil
--!SerializeField
local travelQuizTapH3 : TapHandler = nil
--!SerializeField
local travelQuizTapH4 : TapHandler = nil
--!SerializeField
local travelQuizTapH5 : TapHandler = nil
--!SerializeField
local travelQuizTapH6 : TapHandler = nil
--!SerializeField
local travelQuizTapH7 : TapHandler = nil
--!SerializeField
local travelQuizTapH8 : TapHandler = nil
--!SerializeField
local catQuizTapH1 : TapHandler = nil
--!SerializeField
local catQuizTapH2 : TapHandler = nil
--!SerializeField
local catQuizTapH3 : TapHandler = nil
--!SerializeField
local catQuizTapH4 : TapHandler = nil
--!SerializeField
local catQuizTapH5 : TapHandler = nil
--!SerializeField
local catQuizTapH6 : TapHandler = nil
--!SerializeField
local catQuizTapH7 : TapHandler = nil
--!SerializeField
local catQuizTapH8 : TapHandler = nil

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

travelQuizStarted = BoolValue.new("travelQuizStarted", false)
catQuizStarted = false

minOfPlayers = 2

-- events --
changeRoomServer = Event.new("changeRoomServer")
changeRoomClient = Event.new("changeRoomClient")

hasGameStarted = Event.new("hasGameStarted")
finishGame = Event.new("finishGame")
newPlayerEnteredQuiz = Event.new("newPlayerEnteredQuiz")
setPlayersCurrentPos = Event.new("setPlayersCurrentPos")
playerLeftQuizz = Event.new("playerLeftQuizz")

nextQuestion = Event.new("nextQuestion")
replicateChosenQuestion = Event.new("replicateRandomQuestion")
saveScorePlayer = Event.new("saveScorePlayer")
updateScoreEvent = Event.new("updateScoreEvent")

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

function updateScore(player, howLongToAnswer)
    scorePlayer[player.name] += 2000 - (2000 / 100 * howLongToAnswer)
end

function updateLeaderboards(tableOfPlayers)
    local tableCopy = table.clone(tableOfPlayers)
    local scores = {}
    local biggestNum = 0
    local smallestNum = math.huge
    local tableL = tableLenght(tableCopy)
    local iSet = 1
    local iSort = 1

    -- setting scores array
    for k, player in pairs(tableCopy) do
        scores[iSet] = {player.name, scorePlayer[player.name]}
        iSet += 1
    end

    -- sorting scores array
    local scoresClone = table.clone(scores)
    table.clear(scores)
    for i, v in ipairs(scoresClone) do
        if v[2] > biggestNum then
            biggestNum = v[2]
            table.insert(scores, 1, v)
            iSort += 1
        elseif v[2] < smallestNum then
            smallestNum = v[2]
            table.insert(scores, #scores + 1, v)
        else
            table.insert(scores, iSort, v)
            iSort += 1
        end
    end

    -- converting values to string
    scoresClone = table.clone(scores)
    for i, v in ipairs(scoresClone) do
        table.remove(scores, i)
        table.insert(scores, i, `{i}. {v[1]}'s score: {v[2]}`)
    end

    for k, player in pairs(tableOfPlayers) do
        updateScoreEvent:FireClient(player, scores)
    end
end

function pickRandomQuestion(questionsAsked, category)
    local categoryDifficulty = nil
    local numberAsked = tableLenght(questionsAsked)
    print(`asked: {numberAsked}`)
    local tableOfPlayers
    local pickedQuestion = nil
    local diff
    
    if category == "travel" then
        tableOfPlayers = playersInTravelQ
    elseif category == "cat" then
        tableOfPlayers = playersInCatQ
    end
    
    if numberAsked < 6 then
        categoryDifficulty = questionPool.travel.easy
        diff = "e"
    elseif numberAsked < 11 then
        categoryDifficulty = questionPool.travel.normal
        diff = "n"
    elseif numberAsked < 16 then
        categoryDifficulty = questionPool.travel.hard
        diff = "h"
    else
        for k, player in pairs(tableOfPlayers) do
            finishGame:FireClient(player)
            if category == "travel" then
                travelQAsked = nil travelQAsked = {}
                questionsAsked = travelQAsked
            elseif category == "cat" then
                catQAsked = nil catQAsked = {}
            end
        end

        Timer.After(10, function() pickRandomQuestion(questionsAsked, category) end)
        return
    end

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

    Timer.After(19, function()
        updateLeaderboards(tableOfPlayers)
        Timer.After(2, function()
            pickRandomQuestion(questionsAsked, category)
        end)
    end)
end

function playerLeftQFunc(player, quiz)
    if quiz == "travel" then
        playersInTravelQ[player.name] = nil
        scorePlayer[player.name] = 0
        if tableLenght(playersInTravelQ) <= 0 and travelQuizStarted.value then
            travelQuizStarted.value = false
        end
    elseif quiz == "cat" then
        playersInCatQ[player.name] = nil
        scorePlayer[player.name] = 0
        if tableLenght(playersInTravelQ) <= 0 and catQuizStarted then
            catQuizStarted = false
        end
    end
end


function self:ClientAwake()
    -- setting spawner points
    spawnerPoints["travel"] = {travelSpawner1, travelSpawner2, travelSpawner3, travelSpawner4, travelSpawner5, travelSpawner6,travelSpawner7, travelSpawner8}
    spawnerPoints["kpop"] = kpopSpawner
    spawnerPoints["cat"] = catCoffeSpawner

    -- setting tap handlers
    tapHandlers["travel"] = travelTapH
    tapHandlers["kpop"] = kpopTapH
    tapHandlers["cat"] = catCoffeTapH

    -- tap handlers Quizz
    tapHandlers["travelQuiz"] = {travelQuizTapH1, travelQuizTapH2, travelQuizTapH3, travelQuizTapH4, travelQuizTapH5, travelQuizTapH6, travelQuizTapH7, travelQuizTapH8}
    tapHandlers["catQuizz"] = {catQuizTapH1, catQuizTapH2, catQuizTapH3, catQuizTapH4, catQuizTapH5, catQuizTapH6, catQuizTapH7, catQuizTapH8}

    -- setting other managers and scripts
    uiManager = uiManagerGo
    questionPool = uiManager:GetComponent("QuestionPool")
end

function self:ServerAwake()
    -- events --
    changeRoomServer:Connect(function(player : Player, destination : string)
        changeRoomClient:FireAllClients(player, destination)
    end)

    newPlayerEnteredQuiz:Connect(function(player : Player, quiz : string)
        if quiz == "travel" then
            playersInTravelQ[player.name] = player
            scorePlayer[player.name] = 0
            newPlayerEnteredQuiz:FireAllClients(player, tableLenght(playersInTravelQ))

            if tableLenght(playersInTravelQ) >= minOfPlayers and not travelQuizStarted.value then
                travelQuizStarted.value = true
                Timer.After(20, function() pickRandomQuestion(travelQAsked, quiz) end)
            end
        elseif quiz == "kpop" then
            playersInKpopQ[player.name] = player
        elseif quiz == "cat" then
            playersInCatQ[player.name] = player
            scorePlayer[player.name] = 0
            if tableLenght(playersInTravelQ) >= minOfPlayers and not catQuizStarted then
                catQuizStarted = true
                Timer.After(20, function() pickRandomQuestion(travelQAsked, quiz) end)
            end
        end
    end)

    setPlayersCurrentPos:Connect(function(player : Player, _playerPos : Vector3)
        setPlayersCurrentPos:FireAllClients(player, _playerPos)
    end)

    hasGameStarted:Connect(function(player : Player)
        hasGameStarted:FireClient(player, travelQuizStarted.value)
    end)

    playerLeftQuizz:Connect(function(player : Player, quiz : string)
        playerLeftQFunc(player, quiz)
    end)

    saveScorePlayer:Connect(function(player : Player, howLongToAnswer, lost : boolean)
        if lost == true then
            scorePlayer[player.name] = 0
        else
            updateScore(player, howLongToAnswer)
        end
    end)

    nextQuestion:Connect(function(player, category)
        local questionsAsked
        if category == "testCategory" then
            questionsAsked = testAsked
        elseif category == "travel" then
            questionsAsked = travelQAsked
        elseif category == "cat" then
            questionsAsked = catQAsked
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

