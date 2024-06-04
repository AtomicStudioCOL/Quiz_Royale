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

-- Eptying Items --
aLabel:SetPrelocalizedText(" ", false)
bLabel:SetPrelocalizedText(" ", false)
cLabel:SetPrelocalizedText(" ", false)
dLabel:SetPrelocalizedText(" ", false)
-- dialogueLabel:SetPrelocalizedText(" ", false)
_questionLabel:SetPrelocalizedText(" ", false)
timerLabel:SetPrelocalizedText(" ", false)

-- _questionLabel:ClearClassList()
-- _questionLabel:AddToClassList("inactive")
timerLabel:AddToClassList("inactive")
aLabel:AddToClassList("inactive")
bLabel:AddToClassList("inactive")
cLabel:AddToClassList("inactive")
dLabel:AddToClassList("inactive")
-- -- dialogueLabel:AddToClassList("inactive")

barista:AddToClassList("inactive")

-- variables --
local baristaClass : string
local _baristaClass_True : string
local _baristaClass_False : string

local chosenAnswer = nil

local currentCategory : string

local isButtonSelected = false
local timerStarted = false

local gameManager = nil
local _leaderBoardsUI = nil
local _dialoguesUI = nil

local namePlayer = client.localPlayer.name
local howLongToAnswer : number
local lives = 3

local randomizedAnswers
local questionTimer : Timer
local originalQuestionTimeValue = 15
local questionTimeValue = originalQuestionTimeValue

-- functions --
local function disable()
    self.enabled = false
end
---[[
    function welcomePlayer(category)
        local totalWaitTime
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

        _dialoguesUI.welcomePlayerDialogues()
        if questionPool[currentCategory] == questionPool.travel then
            totalWaitTime = 6
            
            baristaClass = "baristaM"
            _baristaClass_True = "baristaM-True"
            _baristaClass_False = "baristaM-False"
            -- _questionLabel:AddToClassList("inactive")
            -- _questionLabel:ClearClassList()
            
    end
    
    barista:ClearClassList()
    barista:AddToClassList(baristaClass)
    barista:SendToBack()
end
--]]


---[[
function preQuestionDialogue(question)
    if lives == 0 then return end
    
    _leaderBoardsUI.disableLeadersBoardsUI();
    
    barista:ClearClassList()
    barista:AddToClassList(baristaClass)
    barista:SendToBack()
    
    Timer.After(3, function()
        setQuestionLabelsText(question)
    end)
end
--]]

function setQuestionLabelsText(question)
    
    barista:ClearClassList()
    barista:AddToClassList("inactive")
    
    _questionLabel:AddToClassList("active")
    timerLabel:AddToClassList("active")
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
    
    chosenButton:RemoveFromClassList("active")
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

    if chosenAnswer ~= nil then
        if chosenAnswer.truthValue == true then
            _questionLabel:SetPrelocalizedText("Correct!", false)
            gameManager.saveScorePlayer:FireServer(howLongToAnswer)
            barista:AddToClassList(_baristaClass_True)
        else
            _questionLabel:SetPrelocalizedText("Wrong!", false)
            removeLife()
            barista:AddToClassList(_baristaClass_False)
        end
    else
        _questionLabel:SetPrelocalizedText("Wrong!", false)
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

function finalScreen()
    barista:ClearClassList()
    barista:AddToClassList(baristaClass)
    barista:SendToBack()
    _dialoguesUI.finalScreenDialogues(lives)

    if lives > 0 then
        Timer.After(9, function()
            disable()
            barista:AddToClassList("inactive")
        end)
        --[[
        dialogueLabel:SetPrelocalizedText(`That was all for now. Top three players are:`, false)
        Timer.After(3, function()
            dialogueLabel:SetPrelocalizedText(`3: {localScoreTable[3]}.`, false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText(`2: {localScoreTable[2]}.`, false)
                Timer.After(2, function()
                    dialogueLabel:SetPrelocalizedText(`1: {localScoreTable[1]}.`, false)
                end)
            end)
        end)
        --]]
    else
        --[[
            dialogueLabel:SetPrelocalizedText(`You seem a bit distracted. Maybe you should take a walk and clear your mind.`, false)
            --]]
        Timer.After(4, function()
            disable()
            barista:ClearClassList()
            barista:AddToClassList("inactive")
        end)
    end

end

-- events

quitButton:RegisterPressCallback(function()
    gameManager.playersInTravelQ[client.localPlayer.name] = nil

    barista:AddToClassList("inactive")
    disable()
end)

client.PlayerConnected:Connect(function()
    gameManager = gameManagerGo:GetComponent("GameManager")

    _leaderBoardsUI = uImanager:GetComponent("LeadersBoards")

    _dialoguesUI = uImanager:GetComponent("Dialogues")

    gameManager.scorePlayer[namePlayer] = 0;

    gameManager.replicateChosenQuestion:Connect(function(pickedQuestion)
        _dialoguesUI.preQuestionDialoguesUI(pickedQuestion)
        preQuestionDialogue(pickedQuestion)
    end)

    gameManager.scorePlayer[namePlayer] = 0

    gameManager.updateScoreEvent:Connect(function(scoreTable)
        _leaderBoardsUI.setLeaderboards(scoreTable)
    end)

    gameManager.finishGame:Connect(function()
        finalScreen()
    end)
    disable()
end)

