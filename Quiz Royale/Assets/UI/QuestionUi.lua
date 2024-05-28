--!Type(UI)

--!Header("Unity UI Objects")
--!SerializeField
local baristaPlaceholder : GameObject = nil

--!Header("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- modules --
questionPool = require("QuestionPool")

print(`Testing Variables Point Playeres: {gameManagerGo}`)

-- bind labels --
--!Bind
local questionLabel : UILabel = nil
--!Bind
local timerLabel : UILabel = nil
--!Bind
local aLabel : UILabel = nil
--!Bind
local bLabel : UILabel = nil
--!Bind
local cLabel : UILabel = nil
--!Bind
local dLabel : UILabel = nil
--!Bind
local dialogueLabel : UILabel = nil

--!Bind
local firstLabel : UILabel = nil
--!Bind
local secondLabel : UILabel = nil
--!Bind
local thirdLabel : UILabel = nil
--!Bind
local fourthLabel : UILabel = nil
--!Bind
local fifthLabel : UILabel = nil
--!Bind
local sixthLabel : UILabel = nil
--!Bind
local seventhLabel : UILabel = nil
--!Bind
local eighthLabel : UILabel = nil

-- Binding buttons --
--!Bind
local aButton : UIButton = nil
--!Bind
local bButton : UIButton = nil
--!Bind
local cButton : UIButton = nil
--!Bind
local dButton : UIButton = nil
--!Bind
local quitButton : UIButton = nil

-- Eptying Items --
aLabel:SetPrelocalizedText(" ", false)
bLabel:SetPrelocalizedText(" ", false)
cLabel:SetPrelocalizedText(" ", false)
dLabel:SetPrelocalizedText(" ", false)
dialogueLabel:SetPrelocalizedText(" ", false)
questionLabel:SetPrelocalizedText(" ", false)
timerLabel:SetPrelocalizedText(" ", false)

firstLabel:SetPrelocalizedText(" ", false)
secondLabel:SetPrelocalizedText(" ", false)
thirdLabel:SetPrelocalizedText(" ", false)
fourthLabel:SetPrelocalizedText(" ", false)
fifthLabel:SetPrelocalizedText(" ", false)
sixthLabel:SetPrelocalizedText(" ", false)
seventhLabel:SetPrelocalizedText(" ", false)
eighthLabel:SetPrelocalizedText(" ", false)

questionLabel:AddToClassList("inactive")
timerLabel:AddToClassList("inactive")
aLabel:AddToClassList("inactive")
bLabel:AddToClassList("inactive")
cLabel:AddToClassList("inactive")
dLabel:AddToClassList("inactive")
dialogueLabel:AddToClassList("inactive")

baristaPlaceholder:SetActive(false)



-- variables --
local barista : GameObject

local chosenAnswer = nil

local currentCategory : string

local isButtonSelected = false
local timerStarted = false

local gameManager = nil

local namePlayer = client.localPlayer.name
local scoreLocalPlayer = 0
local howLongToAnser : number
local difficultyMaxPoints = 2000

local randomizedAnswers
local questionTimer : Timer
local originalQuestionTimeValue = 15
local questionTimeValue = originalQuestionTimeValue

-- functions --
local function disable()
    self.enabled = false
end

function welcomePlayer(category)
    local totalWaitTime
    currentCategory = category

    if questionPool[currentCategory] == questionPool.testCategory then
        totalWaitTime = 6

        barista = baristaPlaceholder
        dialogueLabel:AddToClassList("dialogue")

        dialogueLabel:SetPrelocalizedText("Welcome to Quiz Café!", false)
        Timer.After(2, function()
            dialogueLabel:SetPrelocalizedText("I'm PLACEHOLDER, your barista, and in today's entretainment menu...!", false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText("We have test questions!", false)
                Timer.After(2, function()
                    dialogueLabel:SetPrelocalizedText("Currently waiting for players.", false)
                end)
            end)
        end)
    end

    barista:SetActive(true)
end
        
function preQuestionDialogue(question)
    barista:SetActive(true)

    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("dialogue")
    dialogueLabel:SetPrelocalizedText(question.baristDialoge, false)

    Timer.After(3, function()

        setQuestionLabelsText(question)
    end)
end

function setQuestionLabelsText(question)
    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("inactive")

    barista:SetActive(false)
    
    questionLabel:AddToClassList("active")
    timerLabel:AddToClassList("active")
    aLabel:AddToClassList("active")
    bLabel:AddToClassList("active")
    cLabel:AddToClassList("active")
    dLabel:AddToClassList("active")

    local answers = question.answers

    -- set question label
    questionLabel:SetPrelocalizedText(question.questionTxt, false)

    randomizedAnswers = nil
    randomizedAnswers = gameManager.shuffleAnswers(answers)

---[[
    aLabel:SetPrelocalizedText(randomizedAnswers.a.txt, false)
    bLabel:SetPrelocalizedText(randomizedAnswers.b.txt, false)
    cLabel:SetPrelocalizedText(randomizedAnswers.c.txt, false)
    dLabel:SetPrelocalizedText(randomizedAnswers.d.txt, false)   
    
    activeAnswerButtons()
--]]
end

function activeAnswerButtons()               -- Assigns the callbacks and adds the buttons to the hierarchy
    if timerStarted == true then return end
    timerStarted = true
    chosenAnswer = nil
    isButtonSelected = false

    questionTimer = Timer.new(1, function () setTimerLabel() end, true)
    

    timerLabel:SetPrelocalizedText(questionTimeValue, false)
    
    aButton:RegisterPressCallback(function() deactivateAnswersButtons(aButton, questionTimeValue, "a") end)
    changeClassButtons(aButton, aLabel, "a")
    
    bButton:RegisterPressCallback(function() deactivateAnswersButtons(bButton, questionTimeValue, "b") end)
    changeClassButtons(bButton, bLabel, "b")

    cButton:RegisterPressCallback(function() deactivateAnswersButtons(cButton, questionTimeValue, "c") end)
    changeClassButtons(cButton, cLabel, "c")

    dButton:RegisterPressCallback(function() deactivateAnswersButtons(dButton, questionTimeValue, "d") end)
    changeClassButtons(dButton, dLabel, "d")    
end

function changeClassButtons(ClassButton, LabelButton, NameButton)
    ClassButton:ClearClassList()
    ClassButton:AddToClassList(NameButton)
    ClassButton:AddToClassList("unChosen")
    ClassButton:Add(LabelButton)
end

function deactivateAnswersButtons(chosenButton : UIButton, timeLeft, chosenOption : string)                 -- Empties the callbacks
    if isButtonSelected == true then return end
    isButtonSelected = true

    aButton:AddToClassList("chosen")
    aButton:RemoveFromClassList("unChosen")

    bButton:AddToClassList("chosen")
    bButton:RemoveFromClassList("unChosen")
    
    cButton:AddToClassList("chosen")
    cButton:RemoveFromClassList("unChosen")

    dButton:AddToClassList("chosen")
    dButton:RemoveFromClassList("unChosen")

    howLongToAnser = originalQuestionTimeValue - timeLeft
    chosenAnswer = randomizedAnswers[chosenOption]

    chosenButton:AddToClassList("feedback")
end

function setTimerLabel()
    questionTimeValue -= 1
    timerLabel:SetPrelocalizedText(tostring(questionTimeValue), false)

    if questionTimeValue == 0 then
        hideAnswersButtons()
        questionTimeValue = originalQuestionTimeValue
        questionTimer:Stop()
        timerStarted = false
    end
end

function hideAnswersButtons()                        -- removes the buttons from the hierarchies
    aButton:ClearClassList()
    bButton:ClearClassList()
    cButton:ClearClassList()
    dButton:ClearClassList()

    aButton:AddToClassList("inactive")
    bButton:AddToClassList("inactive")
    cButton:AddToClassList("inactive")
    dButton:AddToClassList("inactive")

    aLabel:SetPrelocalizedText("", false)
    bLabel:SetPrelocalizedText("", false)
    cLabel:SetPrelocalizedText("", false)
    dLabel:SetPrelocalizedText("", false)

    if chosenAnswer ~= nil then
        questionLabel:SetPrelocalizedText(tostring(chosenAnswer.truthValue), false)
        if chosenAnswer.truthValue == true then
            gameManager.scorePlayer[namePlayer] += difficultyMaxPoints - (difficultyMaxPoints / 100 * howLongToAnser)
        end
    else
        questionLabel:SetPrelocalizedText("False", false)
    end

    firstLabel:SetPrelocalizedText(`{namePlayer}: {tostring(gameManager.scorePlayer[namePlayer])}`, false)
end

-- events

quitButton:RegisterPressCallback(function()
    gameManager.playersInTravelQ[client.localPlayer.name] = nil

    barista:SetActive(false)
    disable()
end)

client.PlayerConnected:Connect(function()
    gameManager = gameManagerGo:GetComponent("GameManager")

    gameManager.scorePlayer[namePlayer] = 0;
    scoreLocalPlayer = gameManager.scorePlayer[namePlayer]

    gameManager.replicateChosenQuestion:Connect(function(pickedQuestion)
        preQuestionDialogue(pickedQuestion)
    end)

    gameManager.finishGame:Connect(function()
        disable()
    end)

    disable()
end)