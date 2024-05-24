--!Type(UI)

--!Headers("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- modules
questionPool = require("QuestionPool")

--!Bind
local questionUi : UILuaView = nil

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
local container : UILabel = nil

-- Eptying labels --
questionLabel:SetPrelocalizedText(" ", false)
timerLabel:SetPrelocalizedText(" ", false)
aLabel:SetPrelocalizedText(" ", false)
bLabel:SetPrelocalizedText(" ", false)
cLabel:SetPrelocalizedText(" ", false)
dLabel:SetPrelocalizedText(" ", false)
dialogueLabel:SetPrelocalizedText(" ", false)

questionLabel:AddToClassList("inactive")
timerLabel:AddToClassList("inactive")
aLabel:AddToClassList("inactive")
bLabel:AddToClassList("inactive")
cLabel:AddToClassList("inactive")
dLabel:AddToClassList("inactive")
dialogueLabel:AddToClassList("inactive")

-- bind images --
--!Bind
local baristaImage : UIImage = nil

-- instantiate buttons --
local aButton = UIButton.new()
local bButton = UIButton.new()
local cButton = UIButton.new()
local dButton = UIButton.new()

-- variables --
local thisObject = self

local barista : string

local chosenAnswer = nil

local questionTimer : Timer
local questionTimeValue = 15

-- functions --
local function disable()
    self.enabled = false
end

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

function welcomePlayer(category)
    local totalWaitTime

    if category == questionPool.testCategory then
        totalWaitTime = 6

        barista = "baristPlaceholder"
        dialogueLabel:AddToClassList("dialogue")

        dialogueLabel:SetPrelocalizedText("Welcome to Quiz Café!", false)
        Timer.After(2, function()
            dialogueLabel:SetPrelocalizedText("I'm PLACEHOLDER, your barista, and in today's entretainment menu...!", false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText("We have test questions!", false)
            end)
        end)
    end

    container:Add(baristaImage)
    baristaImage:AddToClassList(barista)

    Timer.new(totalWaitTime, function()
        --pickRandomQuestion(category.easy)
    end, false)
end

function pickRandomQuestion(categoryDifficulty)
    print("picking question")

    local numberOfQuestions = tableLenght(categoryDifficulty)
    local pickedQuestion = nil

    for k, v in pairs(categoryDifficulty) do
        if pickedQuestion ~= nil then return end

        randomNumber = math.random(1, numberOfQuestions)
        if randomNumber == 1 then
            pickedQuestion = v
            print(`Picked quesion is: {pickedQuestion.questionTxt}`)
            preQuestionDialogue(pickedQuestion)
        end
        numberOfQuestions -= 1
    end
end

function preQuestionDialogue(question)
    baristaImage:ClearClassList()
    baristaImage:AddToClassList(barista)

    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("dialogue")
    dialogueLabel:SetPrelocalizedText(question.baristDialoge, false)

    Timer.After(3, function()

        setQuestionLabelsText(question)
    end)
end

function setQuestionLabelsText(question)
    print("setting question labels")

    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("inactive")
    baristaImage:ClearClassList()
    
    questionLabel:AddToClassList("active")
    timerLabel:AddToClassList("active")
    aLabel:AddToClassList("active")
    bLabel:AddToClassList("active")
    cLabel:AddToClassList("active")
    dLabel:AddToClassList("active")

    local answers = question.answers
    -- set question label
    questionLabel:SetPrelocalizedText(question.questionTxt, false)

    local randomizedAnswers = shuffleAnswers(answers)

---[[
    aLabel:SetPrelocalizedText(randomizedAnswers.a.txt, false)
    bLabel:SetPrelocalizedText(randomizedAnswers.b.txt, false)
    cLabel:SetPrelocalizedText(randomizedAnswers.c.txt, false)
    dLabel:SetPrelocalizedText(randomizedAnswers.d.txt, false)   
    
    activeAnswerButtons(randomizedAnswers)
--]]
end

function activeAnswerButtons(answers)               -- Assigns the callbacks and adds the buttons to the hierarchy
    print("activating buttons")

    questionTimer = Timer.new(1, function () setTimerLabel() end, true)
    timerLabel:SetEmojiPrelocalizedText(questionTimeValue, false)
    
    aButton:RegisterPressCallback(function()
        chosenAnswer = answers.a
        deactivateAnswersButtons()
    end)
    aButton:AddToClassList("unChosen")
    aLabel:Add(aButton)

    bButton:RegisterPressCallback(function()
        chosenAnswer = answers.b
        deactivateAnswersButtons()
    end)
    bButton:AddToClassList("unChosen")
    bLabel:Add(bButton)

    cButton:RegisterPressCallback(function()
        chosenAnswer = answers.c
        deactivateAnswersButtons()
    end)
    cButton:AddToClassList("unChosen")
    cLabel:Add(cButton)

    dButton:AddToClassList("unChosen")
    dButton:RegisterPressCallback(function()
        chosenAnswer = answers.d
        deactivateAnswersButtons()
   end)
    dLabel:Add(dButton)
end

function deactivateAnswersButtons()                 -- Empties the callbacks
    aButton:RegisterPressCallback(function()end)
    aButton:AddToClassList("chosen")
    aButton:RemoveFromClassList("unChosen")

    bButton:RegisterPressCallback(function()end)
    bButton:AddToClassList("chosen")
    bButton:RemoveFromClassList("unChosen")
    
    cButton:RegisterPressCallback(function()end)
    cButton:AddToClassList("chosen")
    cButton:RemoveFromClassList("unChosen")

    dButton:RegisterPressCallback(function()end)
    dButton:AddToClassList("chosen")
    dButton:RemoveFromClassList("unChosen")
end

function setTimerLabel()
    questionTimeValue -= 1
    timerLabel:SetPrelocalizedText(tostring(questionTimeValue), false)

    if questionTimeValue == 0 then
        hideAnswersButtons()
        questionTimeValue = 16
        questionTimer:Stop()
    end
end

function hideAnswersButtons()                        -- removes the buttons from the hierarchies
    aLabel:Remove(aButton)
    bLabel:Remove(bButton)
    cLabel:Remove(cButton)
    dLabel:Remove(dButton)

    aLabel:SetPrelocalizedText("", false)
    bLabel:SetPrelocalizedText("", false)
    cLabel:SetPrelocalizedText("", false)
    dLabel:SetPrelocalizedText("", false)

    if chosenAnswer ~= nil then
        questionLabel:SetPrelocalizedText(tostring(chosenAnswer.truthValue), false)
    else
        questionLabel:SetPrelocalizedText("False", false)
    end
end

-- events
client.PlayerConnected:Connect(function()
    print(`{questionUi.contentRect}`)

    gameManager = gameManagerGo:GetComponent("QuestionPool")
    disable()
end)