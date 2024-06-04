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

    currentCategory = category

    totalWaitTime = 6

    dialogueLabel:AddToClassList("dialogue")

    dialogueLabel:SetPrelocalizedText("Welcome to Quiz Café!", false)
    Timer.After(2, function()
        dialogueLabel:SetPrelocalizedText("I'm Hugo, your barista. Nice to meet you!", false)
        Timer.After(2, function()
            dialogueLabel:SetPrelocalizedText("Let's talk about places around the world!", false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText("Currently waiting for players.", false)
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
    _leaderBoardsUI.disableLeadersBoardsUI()

    if lives <= 0 then
        dialogueLabel:SetPrelocalizedText(`You seem a bit distracted. Maybe you should take a walk and clear your mind.`, false)
        Timer.After(5, function()
                disableDialoguesUI()
        end)
    else
        dialogueLabel:SetPrelocalizedText(`That was all for now. Top three players are:`, false)
        Timer.After(3, function()
            dialogueLabel:SetPrelocalizedText(`3: {localScoreTable[3]}.`, false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText(`2: {localScoreTable[2]}.`, false)
                Timer.After(2, function()
                    dialogueLabel:SetPrelocalizedText(`1: {localScoreTable[1]}.`, false)
                    Timer.After(2, function()
                        disableDialoguesUI()
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
