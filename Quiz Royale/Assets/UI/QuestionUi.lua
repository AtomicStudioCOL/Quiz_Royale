--!Type(UI)

--!Header("Game Objects")
--!SerializeField
local gameManagerGo : GameObject = nil
--!SerializeField
local uImanager : GameObject = nil
--!SerializeField
local AudioManager : GameObject = nil

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
--!Bind
local _reJoinILabel : UILabel = nil

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

_reJoinILabel:SetPrelocalizedText(" ")
_reJoinILabel:ClearClassList()
_reJoinILabel:AddToClassList("inactive")

function setItems()
    aLabel:SetPrelocalizedText(" ")
    bLabel:SetPrelocalizedText(" ")
    cLabel:SetPrelocalizedText(" ")
    dLabel:SetPrelocalizedText(" ")
    _questionLabel:SetPrelocalizedText(" ")
    timerLabel:SetPrelocalizedText(" ")
    _questNum:SetPrelocalizedText(" ")
    _quitLabel:SetPrelocalizedText("X")

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
local _baristaClass_True : string
local _baristaClass_False : string

local chosenAnswer = nil

local currentCategory : string
local correctAnswer : string

local playerWelcomed = false
local isButtonSelected = false
local timerStarted = false
local enabled = true
local waitingForNextQuestion = false

local gameManager = nil
local _leaderBoardsUI = nil
local _dialoguesUI = nil
local _localSounds = nil

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

local function reJoinInstructions()
    _reJoinILabel:SetPrelocalizedText("Click on the pink chairs to rejoin!")
    _reJoinILabel:ClearClassList()
    _reJoinILabel:AddToClassList("active")
    _reJoinILabel:AddToClassList("reJoinILabel")

    autoTurnOffInstructions = Timer.After(4, function()
        _reJoinILabel:SetPrelocalizedText(" ")
        _reJoinILabel:ClearClassList()
        _reJoinILabel:AddToClassList("inactive")

        self.enabled = false
        gameManager.playerLeftQuizz:FireServer(currentCategory)
        end)
end

local function disable()
    enabled = false
    playerWelcomed = false
    timerStarted = false

    questionTimeValue = originalQuestionTimeValue

    hideAnswersButtons()
    setItems()
    stopTimers()
    reJoinInstructions()
    _dialoguesUI.disableDialoguesUI()
    _dialoguesUI.stopTimers()
    _leaderBoardsUI.disableLeadersBoardsUI()

    life1:AddToClassList("inactive")
    life2:AddToClassList("inactive")
    life3:AddToClassList("inactive")

end

function welcomePlayer(category)
    stopTimers()
    _dialoguesUI.stopTimers()
    setItems()
    enabled = false
    hideAnswersButtons()
    enabled = true

    life1:RemoveFromClassList("inactive")
    life2:RemoveFromClassList("inactive")
    life3:RemoveFromClassList("inactive")

    life1:AddToClassList("life_active")
    life2:AddToClassList("life_active")
    life3:AddToClassList("life_active")

    life1:AddToClassList("life1")
    life2:AddToClassList("life2")
    life3:AddToClassList("life3")

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
        _baristaClass_True = "baristaM-True"
        _baristaClass_False = "baristaM-False"    
    end

    _timerPlWelced = Timer.After(17, function()
        playerWelcomed = true
        gameManager.startGame:FireServer(currentCategory)
    end)
end

function preQuestionDialogue(question)     
    barista:ClearClassList()
    barista:AddToClassList("inactive")

    waitingForNextQuestion = false
    _questionLabel:ClearClassList()
    _questionLabel:AddToClassList("inactive")

    _leaderBoardsUI.disableLeadersBoardsUI();
    _questNum:ClearClassList()
    _questNum:AddToClassList("questNum")
    
    _timerSetQuesLT = Timer.After(3, function()
        if enabled == false then return end
        setQuestionLabelsText(question)
        _dialoguesUI.showDialogueBox(false)
    end)
end

function setQuestionLabelsText(question)
    
    _questionLabel:AddToClassList("active")
    _questionLabel:AddToClassList("questionLabel")
    timerLabel:AddToClassList("timerLabel")
    aLabel:AddToClassList("active")
    bLabel:AddToClassList("active")
    cLabel:AddToClassList("active")
    dLabel:AddToClassList("active")

    local answers = question.answers
    for answer, element in pairs(answers) do
        if element.truthValue == true then
            correctAnswer = element.txt
        end
    end

    -- set question label
    _questionLabel:SetPrelocalizedText(question.questionTxt)

    randomizedAnswers = nil
    randomizedAnswers = gameManager.shuffleAnswers(answers)

    aLabel:SetPrelocalizedText(randomizedAnswers.a.txt)
    bLabel:SetPrelocalizedText(randomizedAnswers.b.txt)
    cLabel:SetPrelocalizedText(randomizedAnswers.c.txt)
    dLabel:SetPrelocalizedText(randomizedAnswers.d.txt)   
    
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

    questionTimeValue = originalQuestionTimeValue
    questionTimer = Timer.new(1, function () setTimerLabel() end, true)
    
    timerLabel:SetPrelocalizedText(`0:0{questionTimeValue}`)
    
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
        gameManager.saveScorePlayer:FireServer(howLongToAnswer, true, false)
    else
        gameManager.saveScorePlayer:FireServer(howLongToAnswer, false, false)
    end

    
    chosenButton:RemoveFromClassList("active")
    chosenButton:AddToClassList("feedback")
end

function soundFeedback()
    if chosenAnswer == nil or chosenAnswer.truthValue == false then
        _localSounds.playSound(_localSounds.incorrectSound, 1)
    else
        _localSounds.playSound(_localSounds.correctSound, .5)
    end
end

function setTimerLabel()
    if enabled == false then
        timerStarted = false
        questionTimer:Stop()
        questionTimeValue = originalQuestionTimeValue
        return
    end

    questionTimeValue -= 1
    if questionTimeValue > 9 then
        timerLabel:SetPrelocalizedText(`0:{questionTimeValue}`)
    else
        timerLabel:SetPrelocalizedText(`0:0{questionTimeValue}`)
    end

    if questionTimeValue <= 0 then
        soundFeedback()
        hideAnswersButtons()
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

    aLabel:SetPrelocalizedText("")
    bLabel:SetPrelocalizedText("")
    cLabel:SetPrelocalizedText("")
    dLabel:SetPrelocalizedText("")

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
        _questionLabel:SetPrelocalizedText("Correct!")
        barista:AddToClassList(_baristaClass_True)
        barista:BringToFront()
    else
        _questionLabel:SetPrelocalizedText(`Wrong! The correct answer was '{correctAnswer}'.`)
        barista:AddToClassList(_baristaClass_False)
        barista:BringToFront()
        removeLife()
    end
end

function removeLife()
    lives -= 1
    Timer.After(.5, function()
        _localSounds.playSound(_localSounds.lostLife, .25)
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
    end)
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
    
    if lives > 0 then
        _dialoguesUI.finalScreenDialogues(localScoreTable)
    else
        gameManager.saveScorePlayer:FireServer(howLongToAnswer, false, true)
        _questionLabel:SetPrelocalizedText("Oh no! Your lives! Well... Recover your score!")
    end
    _timerResLiv = Timer.After(1, function()
        lives = 3
        resetLives()
    end)
end

-- events

quitButton:RegisterPressCallback(function()
    barista:AddToClassList("inactive")
    disable()
end)

function self:ClientAwake()
    gameManager = gameManagerGo:GetComponent("GameManager")
    _leaderBoardsUI = uImanager:GetComponent("LeadersBoards")
    _dialoguesUI = uImanager:GetComponent("Dialogues")
    _localSounds = AudioManager:GetComponent("LocalSounds")

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
    
    gameManager.scorePlayer[namePlayer] = "waiting"
    
    gameManager.updateScoreEvent:Connect(function(scoreTable)
        if not playerWelcomed then return end

        if not waitingForNextQuestion then _leaderBoardsUI.setLeaderboards(scoreTable) end
        localScoreTable = scoreTable
    end)

    gameManager.allPlayersAnswered:Connect(function() questionTimeValue = 1 end)
    
    gameManager.finishGame:Connect(function()
        finalScreen()
    end)
    
end