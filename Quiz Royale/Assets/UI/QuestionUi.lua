--!Type(UI)

--!Header("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

--!SerializeField
local uImanager : GameObject = nil

-- modules --
questionPool = require("QuestionPool")

-- bind labels --
--!Bind
local _questionLabel : UILabel = nil
--!Bind
local timerLabel : UILabel = nil
--!Bind
local _questNum : UILabel = nil
--!Bind
local _quitLabel : UILabel = nil
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

-- lives --
--!Bind
local life1 : UIImage = nil
--!Bind
local life2 : UIImage = nil
--!Bind
local life3 : UIImage = nil
--!Bind
local barista : UIImage = nil

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

-- Eptying and setting items --

function setItems()
    aLabel:SetPrelocalizedText(" ", false)
    bLabel:SetPrelocalizedText(" ", false)
    cLabel:SetPrelocalizedText(" ", false)
    dLabel:SetPrelocalizedText(" ", false)
    _questionLabel:SetPrelocalizedText(" ", false)
    timerLabel:SetPrelocalizedText(" ", false)
    _questNum:SetPrelocalizedText(" ", false)
    _quitLabel:SetPrelocalizedText("X", false)

    timerLabel:ClearClassList()
    aLabel:ClearClassList()
    bLabel:ClearClassList()
    cLabel:ClearClassList()
    dLabel:ClearClassList()
    _questionLabel:ClearClassList()
    
    aLabel:AddToClassList("inactive")
    bLabel:AddToClassList("inactive")
    cLabel:AddToClassList("inactive")
    dLabel:AddToClassList("inactive")
    _questNum:AddToClassList("inactive")
    _questionLabel:AddToClassList("inactive")

    barista:AddToClassList("inactive")

    -- setting quit button label child
    quitButton:Add(_quitLabel)
end

setItems()

-- variables --
local baristaClass : string
local _baristaClass_True : string
local _baristaClass_False : string

local chosenAnswer = nil

local currentCategory : string

local playerWelcomed = false
local isButtonSelected = false
local timerStarted = false
local enabled = true
local waitingForNextQuestion = false

local gameManager = nil
local _leaderBoardsUI = nil
local _dialoguesUI = nil

local namePlayer = client.localPlayer.name
local howLongToAnswer : number
local lives = 3

local randomizedAnswers
local originalQuestionTimeValue = 15
local questionTimeValue = originalQuestionTimeValue

local questionTimer : Timer
local _timerPlWelced : Timer
local _timerSetQuesLT : Timer
local _timerResLiv : Timer

local localScoreTable = {}

-- functions --
local function stopTimers()
    if questionTimer ~= nil then questionTimer:Stop() end
    if _timerPlWelced ~= nil then _timerPlWelced:Stop() end
    if _timerSetQuesLT ~= nil then _timerSetQuesLT:Stop() end
    if _timerResLiv ~= nil then _timerResLiv:Stop() end
end

local function disable()
    setItems()
    questionTimeValue = originalQuestionTimeValue
    enabled = false
    playerWelcomed = false
    timerStarted = false
    _dialoguesUI.disableDialoguesUI()
    _dialoguesUI.stopTimers()
    stopTimers()
    _leaderBoardsUI.disableLeadersBoardsUI()
    gameManager.playerLeftQuizz:FireServer(currentCategory)
    self.enabled = false
end

function welcomePlayer(category)
    stopTimers()
    _dialoguesUI.stopTimers()
    setItems()
    enabled = false
    hideAnswersButtons()
    enabled = true

    hasGameStarted = gameManager.travelQuizStarted.value

    if hasGameStarted then
        waitingForNextQuestion = true
    else
        waitingForNextQuestion = false
    end

    life1:RemoveFromClassList("life_lost")
    life2:RemoveFromClassList("life_lost")
    life3:RemoveFromClassList("life_lost")
    
    life1:AddToClassList("life1")
    life2:AddToClassList("life2")
    life3:AddToClassList("life3")
    
    life1:AddToClassList("life_active")
    life2:AddToClassList("life_active")
    life3:AddToClassList("life_active")    
    lives = 3
    currentCategory = category

    _questionLabel:ClearClassList()
    _questionLabel:AddToClassList("inactive")

    _dialoguesUI.welcomePlayerDialogues()
    if questionPool[currentCategory] == questionPool.travel or questionPool[currentCategory] == questionPool.cat then
        baristaClass = "baristaM"
        _baristaClass_True = "baristaM-True"
        _baristaClass_False = "baristaM-False"    
    end

    barista:ClearClassList()
    barista:AddToClassList(baristaClass)
    barista:SendToBack()

    _timerPlWelced = Timer.After(17, function() playerWelcomed = true end)
end

function preQuestionDialogue(question)
    waitingForNextQuestion = false
    _leaderBoardsUI.disableLeadersBoardsUI();
    _questNum:ClearClassList()
    _questNum:AddToClassList("questNum")
    
    barista:ClearClassList()
    barista:AddToClassList(baristaClass)
    barista:SendToBack()
    
    _timerSetQuesLT = Timer.After(3, function()
        if enabled == false then return end
        setQuestionLabelsText(question)
        _dialoguesUI.showDialogueBox(false)
    end)
end

function setQuestionLabelsText(question)
    
    barista:ClearClassList()
    barista:AddToClassList("inactive")
    
    _questionLabel:AddToClassList("active")
    _questionLabel:AddToClassList("questionLabel")
    timerLabel:AddToClassList("timerLabel")
    aLabel:AddToClassList("active")
    bLabel:AddToClassList("active")
    cLabel:AddToClassList("active")
    dLabel:AddToClassList("active")

    local answers = question.answers

    -- set question label
    _questionLabel:SetPrelocalizedText(question.questionTxt, false)

    randomizedAnswers = nil
    randomizedAnswers = gameManager.shuffleAnswers(answers)

    aLabel:SetPrelocalizedText(randomizedAnswers.a.txt, false)
    bLabel:SetPrelocalizedText(randomizedAnswers.b.txt, false)
    cLabel:SetPrelocalizedText(randomizedAnswers.c.txt, false)
    dLabel:SetPrelocalizedText(randomizedAnswers.d.txt, false)   
    
    activeAnswerButtons()
end

function activeAnswerButtons()               -- Assigns the callbacks and adds the buttons to the hierarchy
    if timerStarted == true then return end
    timerStarted = true
    chosenAnswer = nil
    isButtonSelected = false

    aLabel:ClearClassList()
    bLabel:ClearClassList()
    cLabel:ClearClassList()
    dLabel:ClearClassList()

    aLabel:AddToClassList("active")
    bLabel:AddToClassList("active")
    cLabel:AddToClassList("active")
    dLabel:AddToClassList("active")

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
    
    howLongToAnswer = originalQuestionTimeValue - timeLeft
    chosenAnswer = randomizedAnswers[chosenOption]

    if chosenAnswer ~= nil and chosenAnswer.truthValue == true  then
        gameManager.saveScorePlayer:FireServer(howLongToAnswer, false)
    end

    
    chosenButton:RemoveFromClassList("active")
    chosenButton:AddToClassList("feedback")
end

function setTimerLabel()
    if enabled == false then
        timerStarted = false
        questionTimer:Stop()
        questionTimeValue = originalQuestionTimeValue
        return
    end

    questionTimeValue -= 1
    timerLabel:SetPrelocalizedText(tostring(questionTimeValue), false)

    if questionTimeValue == 0 then
        hideAnswersButtons()
        questionTimeValue = originalQuestionTimeValue
        questionTimer:Stop()
        timerStarted = false
    end
end

function hideAnswersButtons() -- removes the buttons from the hierarchies
    aButton:ClearClassList()
    bButton:ClearClassList()
    cButton:ClearClassList()
    dButton:ClearClassList()
    barista:ClearClassList()

    aButton:AddToClassList("inactive")
    bButton:AddToClassList("inactive")
    cButton:AddToClassList("inactive")
    dButton:AddToClassList("inactive")

    aLabel:SetPrelocalizedText("", false)
    bLabel:SetPrelocalizedText("", false)
    cLabel:SetPrelocalizedText("", false)
    dLabel:SetPrelocalizedText("", false)

    aLabel:ClearClassList()
    bLabel:ClearClassList()
    cLabel:ClearClassList()
    dLabel:ClearClassList()

    aLabel:AddToClassList("inactive")
    bLabel:AddToClassList("inactive")
    cLabel:AddToClassList("inactive")
    dLabel:AddToClassList("inactive")

    if enabled == false then return end

    if chosenAnswer ~= nil and chosenAnswer.truthValue == true  then
        _questionLabel:SetPrelocalizedText("Correct!", false)
        barista:AddToClassList(_baristaClass_True)
    else
        _questionLabel:SetPrelocalizedText("Wrong!", false)
        barista:AddToClassList(_baristaClass_False)
        removeLife()
    end
end

function removeLife()
    lives -= 1
    if lives == 2 then
        life3:RemoveFromClassList("life_active")
        life3:AddToClassList("life_lost")
    elseif lives == 1 then
        life2:RemoveFromClassList("life_active")
        life2:AddToClassList("life_lost")
    elseif lives == 0 then
        life1:RemoveFromClassList("life_active")
        life1:AddToClassList("life_lost")
        finalScreen()
    end
end

function resetLives()
    life3:RemoveFromClassList("life_lost")
    life3:AddToClassList("life_active")
    life2:RemoveFromClassList("life_lost")
    life2:AddToClassList("life_active")
    life1:RemoveFromClassList("life_lost")
    life1:AddToClassList("life_active")
end

function finalScreen()
    _dialoguesUI.finalScreenDialogues(lives, localScoreTable)
    
    if lives >= 0 then
        gameManager.saveScorePlayer:FireServer(howLongToAnswer, true)
    else
        barista:ClearClassList()
        barista:AddToClassList(baristaClass)
        barista:SendToBack()    end
    _timerResLiv = Timer.After(.5, function()
        lives = 3
        resetLives()
    end)
end

-- events

quitButton:RegisterPressCallback(function()
    gameManager.playerLeftQuizz:FireServer("travel")

    barista:AddToClassList("inactive")
    disable()
end)

function self:ClientAwake()
    gameManager = gameManagerGo:GetComponent("GameManager")
    
    _leaderBoardsUI = uImanager:GetComponent("LeadersBoards")
    
    _dialoguesUI = uImanager:GetComponent("Dialogues")

    gameManager.scorePlayer[namePlayer] = 0
    
    gameManager.replicateChosenQuestion:Connect(function(pickedQuestion)
        if not playerWelcomed then return end

        _dialoguesUI.preQuestionDialoguesUI(pickedQuestion)
        preQuestionDialogue(pickedQuestion)
    end)

    gameManager.currentQuestNum:Connect(function(currentQuestNum)
        if currentQuestNum > 15 then return end
        _questNum:SetPrelocalizedText(`{currentQuestNum} / 15`)
    end)
    
    gameManager.scorePlayer[namePlayer] = 0
    
    gameManager.updateScoreEvent:Connect(function(scoreTable)
        if not playerWelcomed then return end

        if not waitingForNextQuestion then _leaderBoardsUI.setLeaderboards(scoreTable) end
        localScoreTable = scoreTable
    end)
    
    gameManager.finishGame:Connect(function()
        finalScreen()
    end)
    
end

