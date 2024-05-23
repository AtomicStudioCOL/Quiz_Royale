--!Type(UI)

--!Headers("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- modules
questionPool = require("QuestionPool")

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

-- instantiate buttons --
local aButton = UIButton.new()
local bButton = UIButton.new()
local cButton = UIButton.new()
local dButton = UIButton.new()

-- variables --
local questionTimer : Timer
local questionTimeValue = 16
local chosenAnswer = nil

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

    --[[
    for k, v in pairs(answers) do
        local randomNumber = math.random(1, optionsToAssign)

        if optionsToAssign == 4 then
            shuffled.a = v
        elseif optionsToAssign == 3 then
            shuffled.b = v
        elseif optionsToAssign == 2 then
            shuffled.c = v
        elseif optionsToAssign == 1 then
            shuffled.d = v
        end 
        optionsToAssign -= 1
    end
    --]]

    return shuffled
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
            setQuestionLabelsText(pickedQuestion)
        end
        numberOfQuestions -= 1
    end
end

function activeAnswerButtons(answers)               -- Assigns the callbacks and adds the buttons to the hierarchy
    print("activating buttons")

    questionTimer = Timer.new(1, function () setTimerLabel() end, true)
    
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

function setQuestionLabelsText(question)
    print("setting question labels")

    local answers = question.answers
    -- set question label
    questionLabel:SetPrelocalizedText(question.questionTxt, false)

    local randomizedAnswers = shuffleAnswers(answers)

    for k, v in pairs(randomizedAnswers) do
        print(`Key: {k}, value: {v}`)
    end

---[[
    aLabel:SetPrelocalizedText(randomizedAnswers.a.txt, false)
    bLabel:SetPrelocalizedText(randomizedAnswers.b.txt, false)
    cLabel:SetPrelocalizedText(randomizedAnswers.c.txt, false)
    dLabel:SetPrelocalizedText(randomizedAnswers.d.txt, false)   
    
    activeAnswerButtons(randomizedAnswers)
--]]
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

-- events
client.PlayerConnected:Connect(function()

    gameManager = gameManagerGo:GetComponent("QuestionPool")
    disable()
end)