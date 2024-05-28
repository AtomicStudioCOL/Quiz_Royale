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

travelQAsked = {}
kpopQAsked = {}
catQAsked = {}

-- events --
changeRoomServer = Event.new("changeRoomServer")
changeRoomClient = Event.new("changeRoomClient")

startGame = Event.new("startGame")
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
    
    if category == "testCategory" then
        tableOfPlayers = playersInTravelQ
    end
    
    if numberAsked < 6 then
        categoryDifficulty = questionPool[category].easy
    elseif numberAsked < 11 then
        print(`line 97 test {questionPool[category].easy}`)
        categoryDifficulty = questionPool[category].normal
    elseif numberAsked < 16 then
        categoryDifficulty = questionPool[category].hard
    end

    local numberOfQuestions = tableLenght(categoryDifficulty)
    local pickedQuestion = nil

    for k, v in pairs(categoryDifficulty) do
        if v.asked == true then
            numberOfQuestions -=1
            if numberOfQuestions < 1 and pickedQuestion == nil then
                pickRandomQuestion(categoryDifficulty)
                return
            end
            continue
        end

        if pickedQuestion ~= nil then return end

        randomNumber = math.random(1, numberOfQuestions)
        if randomNumber == 1 then
            v.asked = true
            pickedQuestion = v
            questionsAsked[k] = v
            print(`Picked quesion is: {pickedQuestion.questionTxt}`)

            for k, v in pairs(tableOfPlayers) do
                replicateChosenQuestion:FireClient(v, pickedQuestion)
            end
            Timer.After(15, function()
            end)
        end
        numberOfQuestions -= 1
    end
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
            print(`{tableLenght(playersInTravelQ)} players in travel quiz`)
            if tableLenght(playersInTravelQ) > 1 then
                Timer.After(6, function() pickRandomQuestion(travelQAsked, "testCategory") end)
            end
        elseif quiz == "kpop" then
            playersInKpopQ[player.name] = player
        elseif quiz == "cat" then
            playersInCatQ[player.name] = player
        end
    end)

    nextQuestion:Connect(function(player, questionsAsked, category)
        pickRandomQuestion(questionsAsked, category)
    end)
end

-- events --
scene.PlayerJoined:Connect(function(scene, player : Player)
    player.CharacterChanged:Connect(function()
        playersInGame[player.name] = player.character.gameObject
     end)
end)

