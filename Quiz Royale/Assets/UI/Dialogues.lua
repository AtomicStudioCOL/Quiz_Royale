--!Type(UI)

--!Header("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- modules --
questionPool = require("QuestionPool")

--!Bind
local dialogueLabel : UILabel = nil

local _gameManager = nil
local _leaderBoardsUI = nil

-- variables --
local _timDial1 : Timer
local _timDial2 : Timer
local _timDial3 : Timer
local _timDial4 : Timer
local _timDial5 : Timer
local _timDial6 : Timer
local _canWelcome = true

dialogueLabel:SetPrelocalizedText(" ", false)
dialogueLabel:AddToClassList("inactive")

-- functions --
function disableDialoguesUI()
    self.enabled = false
end

function stopTimers()
    _canWelcome = false
    if _timDial1 ~= nil then _timDial1:Stop() end
    if _timDial2 ~= nil then _timDial2:Stop() end
    if _timDial3 ~= nil then _timDial3:Stop() end
    if _timDial4 ~= nil then _timDial4:Stop() end
    if _timDial5 ~= nil then _timDial5:Stop() end
    if _timDial6 ~= nil then _timDial6:Stop() end
end

function welcomePlayerDialogues(category)
    local totalWaitTime
    local waitingText
    local hasGameStarted

    Timer.After(1.9, function() _canWelcome = true end)

    currentCategory = category

    hasGameStarted = _gameManager.travelQuizStarted.value

    if hasGameStarted then
        waitingText = "Currently waiting for next question."
    else
        waitingText = "Currently waiting for players."
    end

    dialogueLabel:AddToClassList("dialogue")

    dialogueLabel:SetPrelocalizedText("Welcome to Quiz Café!", false)
    _timDial1 = Timer.After(2, function()
        dialogueLabel:SetPrelocalizedText("I'm Hui Ying , your barista. Nice to meet you!", false)
        _timDial2 = Timer.After(3, function()
            if not _canWelcome then return end
            dialogueLabel:SetPrelocalizedText("In this café, we don't only have tasty coffees and meals,", false)
            _timDial3 = Timer.After(3, function()
                if not _canWelcome then return end
                dialogueLabel:SetPrelocalizedText("but we feed our minds with knowledge as well!", false)
                _timDial4 = Timer.After(4, function()
                    if not _canWelcome then return end
                    dialogueLabel:SetPrelocalizedText("Answer questions correctly to become the best player in the game. Fastest to answer gain more points!", false)
                    _timDial5 = Timer.After(3, function()
                        if not _canWelcome then return end
                        dialogueLabel:SetPrelocalizedText("Answer wrong three times and your score will drop to 0.", false)
                        _timDial6 = Timer.After(2, function()
                            if not _canWelcome then return end
                            dialogueLabel:SetPrelocalizedText(waitingText, false)
                        end)
                    end)
                end)
            end)
        end)
    end)
end
        
function preQuestionDialoguesUI(question)

    _leaderBoardsUI.disableLeadersBoardsUI()
    showDialogueBox(true)

    dialogueLabel:SetPrelocalizedText(question.baristDialoge, false)

end

function showDialogueBox (showing : boolean)
    if showing then
        dialogueLabel:ClearClassList()
        dialogueLabel:AddToClassList("dialogue")
    else
        dialogueLabel:ClearClassList()
        dialogueLabel:AddToClassList("inactive")
    end
end

function finalScreenDialogues(lives, localScoreTable)
    showDialogueBox(true)
    
    if lives <= 0 then
        dialogueLabel:SetPrelocalizedText(`Oh no! Your lives! Well... Recover your score!`, false)
    else
        _leaderBoardsUI.disableLeadersBoardsUI()
        
        local _top3 = localScoreTable[3] ~= nil
        local _top2 = localScoreTable[2] ~= nil
        local t3t = 0
        local t2t = 0

        if _top3 then
            t3t = 2
        end
        if _top2 then
            t2t = 2
        end
        
        dialogueLabel:SetPrelocalizedText(`That was all for now. Best game players are:`, false)
        Timer.After((3), function()
            dialogueLabel:SetPrelocalizedText(`{localScoreTable[3]}.`, false)
            Timer.After(t3t, function()
                dialogueLabel:SetPrelocalizedText(`{localScoreTable[2]}.`, false)
                Timer.After(t2t, function()
                    dialogueLabel:SetPrelocalizedText(`{localScoreTable[1]}.`, false)
                    Timer.After(3, function()
                        dialogueLabel:SetPrelocalizedText(`Restarting game.`, false)
                    end)
                end)
            end)
        end)
    end
end

client.PlayerConnected:Connect(function()
    _gameManager = gameManagerGo:GetComponent("GameManager")
    _leaderBoardsUI = _gameManager.uiManager:GetComponent("LeadersBoards")
end)
