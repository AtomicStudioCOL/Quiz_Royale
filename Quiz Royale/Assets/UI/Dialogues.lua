--!Type(UI)

--!Header("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

--!SerializeField
local questionUI : GameObject = nil
-- modules --
questionPool = require("QuestionPool")

--!Bind
local dialogueLabel : UILabel = nil

local _gameManager = nil
local _leaderBoardsUI = nil


dialogueLabel:SetPrelocalizedText(" ", false)
dialogueLabel:AddToClassList("inactive")

function welcomePlayerDialogues(category)
    local totalWaitTime

    currentCategory = category

    if questionPool[currentCategory] == questionPool.travel then
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
end
        
function preQuestionDialoguesUI(question)

    _leaderBoardsUI.disableLeadersBoardsUI()

    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("dialogue")
    dialogueLabel:SetPrelocalizedText(question.baristDialoge, false)
    --[[
        Timer.After(3, function()
            -- Search script Questions
            setQuestionLabelsText(question)
        end)
    --]]
end


function finalScreenDialogues(lives)
    
    dialogueLabel:ClearClassList()
    dialogueLabel:AddToClassList("dialogue")

    if lives > 0 then
        --[[
        dialogueLabel:SetPrelocalizedText(`That was all for now. Top three players are:`, false)
        Timer.After(3, function()
            dialogueLabel:SetPrelocalizedText(`3: {localScoreTable[3]}.`, false)
            Timer.After(2, function()
                dialogueLabel:SetPrelocalizedText(`2: {localScoreTable[2]}.`, false)
                Timer.After(2, function()
                    dialogueLabel:SetPrelocalizedText(`1: {localScoreTable[1]}.`, false)
                    Timer.After(2, function()
                        disable()
                        barista:AddToClassList("inactive")
                    end)
                end)
            end)
        end)
        --]]
    else
        dialogueLabel:SetPrelocalizedText(`You seem a bit distracted. Maybe you should take a walk and clear your mind.`, false)
        --[[
        Timer.After(4, function()
                disable()
                barista:ClearClassList()
                barista:AddToClassList("inactive")
            end)
            --]]
    end

end


client.PlayerConnected:Connect(function()
    _gameManager = gameManagerGo:GetComponent("GameManager")
    _leaderBoardsUI = _gameManager.uiManager:GetComponent("LeadersBoards")

end)
