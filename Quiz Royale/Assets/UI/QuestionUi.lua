--!Type(UI)

--!Header("Unity UI Objects")
--!SerializeField
local baristaPlaceholder : GameObject = nil

--!Header("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- modules --
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
--!Bind
local dialogueLabel : UILabel = nil

-- Eptying Items --
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

baristaPlaceholder:SetActive(false)

-- Binding buttons --
--!Bind
local aButton : UIButton = nil
--!Bind
local bButton : UIButton = nil
--!Bind
local cButton : UIButton = nil
--!Bind
local dButton : UIButton = nil

-- variables --
local thisObject = self

local barista : GameObject

local chosenAnswer = nil

local questionsAsked = {}
local questionTimer : Timer
local originalQuestionTimeValue = 15
local questionTimeValue = originalQuestionTimeValue

local currentCategory : string
local currentDifficulty : string = "easy"

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
            end)
        end)
    end

    barista:SetActive(true)

    Timer.new(totalWaitTime, function()
        if tableLenght(questionsAsked ) == 5 then
            currentDifficulty = "normal"
        elseif tableLenght(questionsAsked) == 10 then
            currentDifficulty = "hard"
        end

        pickRandomQuestion(questionPool[currentCategory][currentDifficulty])
    end, false)
end

function pickRandomQuestion(categoryDifficulty)
    print("picking question")

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
            preQuestionDialogue(pickedQuestion)
        end
        numberOfQuestions -= 1
    end
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
    print("setting question labels")

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
    chosenAnswer = nil

    questionTimer = Timer.new(1, function () setTimerLabel() end, true)
    timerLabel:SetEmojiPrelocalizedText(questionTimeValue, false)
    
    aButton:RegisterPressCallback(function()
        chosenAnswer = answers.a
        deactivateAnswersButtons()
    end)
    aButton:ClearClassList()
    aButton:AddToClassList("a")
    aButton:AddToClassList("unChosen")
    aButton:Add(aLabel)

    bButton:RegisterPressCallback(function()
        chosenAnswer = answers.b
        deactivateAnswersButtons()
    end)
    bButton:ClearClassList()
    bButton:AddToClassList("b")
    bButton:AddToClassList("unChosen")
    bButton:Add(bLabel)

    cButton:RegisterPressCallback(function()
        chosenAnswer = answers.c
        deactivateAnswersButtons()
    end)
    cButton:ClearClassList()
    cButton:AddToClassList("c")
    cButton:AddToClassList("unChosen")
    cButton:Add(cLabel)

    dButton:RegisterPressCallback(function()
        chosenAnswer = answers.d
        deactivateAnswersButtons()
   end)
    dButton:ClearClassList()
    dButton:AddToClassList("d")
    dButton:AddToClassList("unChosen")
    dButton:Add(dLabel)
end

function deactivateAnswersButtons()                 -- Empties the callbacks
    aButton:RegisterPressCallback()
    aButton:AddToClassList("chosen")
    aButton:RemoveFromClassList("unChosen")

    bButton:RegisterPressCallback()
    bButton:AddToClassList("chosen")
    bButton:RemoveFromClassList("unChosen")
    
    cButton:RegisterPressCallback()
    cButton:AddToClassList("chosen")
    cButton:RemoveFromClassList("unChosen")

    dButton:RegisterPressCallback()
    dButton:AddToClassList("chosen")
    dButton:RemoveFromClassList("unChosen")
end

function setTimerLabel()
    questionTimeValue -= 1
    timerLabel:SetPrelocalizedText(tostring(questionTimeValue), false)

    if questionTimeValue == 0 then
        hideAnswersButtons()
        questionTimeValue = originalQuestionTimeValue
        questionTimer:Stop()

        local numberOfQuestionsAsked = tableLenght(questionsAsked)

        print(`{numberOfQuestionsAsked}`)

        if numberOfQuestionsAsked < 15 then
            if numberOfQuestionsAsked == 5 then
                currentDifficulty = "normal"
            elseif numberOfQuestionsAsked == 10 then
                currentDifficulty = "hard"
            end
            Timer.After(1, function()
                pickRandomQuestion(questionPool[currentCategory][currentDifficulty])
            end)
        else
            currentDifficulty = "easy"

            for difficultyK, difficultyV in questionPool[currentCategory] do
                for questionK, questionV in difficultyV do
                    questionV.asked = false
                end
            end
            for k, v in questionsAsked do
                questionsAsked[k] = nil
            end

            disable()
        end
        
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
    else
        questionLabel:SetPrelocalizedText("False", false)
    end
end

-- events
client.PlayerConnected:Connect(function()
    gameManager = gameManagerGo:GetComponent("QuestionPool")
    disable()
end)