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


dialogueLabel:SetPrelocalizedText(" ", false)
dialogueLabel:AddToClassList("inactive")

-- functions --
function disableDialoguesUI()
    self.enabled = false
end

function welcomePlayerDialogues(category)
    local totalWaitTime
    local waitingText
    local hasGameStarted

    currentCategory = category

    -- _gameManager.hasGameStarted:FireServer(hasGameStarted)
    -- _gameManager.hasGameStarted:Connect(function(boolean)
    --     print(`hasGameStarted connected, {boolean}`)
    --     hasGameStarted = boolean
    -- end)

    hasGameStarted = _gameManager.travelQuizStarted.value

    if hasGameStarted then
        waitingText = "Currently waiting for next question."
    else
        waitingText = "Currently waiting for players."
    end

    dialogueLabel:AddToClassList("dialogue")

    dialogueLabel:SetPrelocalizedText("Welcome to Quiz Café!", false)
    Timer.After(2, function()
        dialogueLabel:SetPrelocalizedText("I'm Hugo, your barista. Nice to meet you!", false)
        Timer.After(3, function()
            dialogueLabel:SetPrelocalizedText("In this café, we don't only have tasty coffees and meals,", false)
            Timer.After(3, function()
                dialogueLabel:SetPrelocalizedText("but we feed our minds with knowledge as well!", false)
                Timer.After(3, function()
                    dialogueLabel:SetPrelocalizedText("Answer right fastly and you might be the best player of the game.", false)
                    Timer.After(3, function()
                        dialogueLabel:SetPrelocalizedText("Answer wrong three times and your score will drop to 0.", false)
                        Timer.After(3, function()
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
                end)
            end)
        end)
    end
end

client.PlayerConnected:Connect(function()
    _gameManager = gameManagerGo:GetComponent("GameManager")
    _leaderBoardsUI = _gameManager.uiManager:GetComponent("LeadersBoards")
end)
