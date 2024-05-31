--!Type(UI)

--!Headers("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- bind labels --
--!Bind
local titleLabel : UILabel = nil
--!Bind
local travelLabel : UILabel = nil
--!Bind
local catLabel : UILabel = nil
--!Bind
--local kpopLabel : UILabel = nil

-- Bind buttons --
--!Bind
local catButton : UIButton = nil
--!Bind
local travelButton  : UIButton = nil
-- --!Bind
--local kpopButton : UIButton = nil

-- variables --
local gameManager = nil
local scoreLocalPlayer = 0
local namePlayer = client.localPlayer.name

-- set tex ts --
titleLabel:SetPrelocalizedText("Quiz Royale", true)
travelLabel:SetPrelocalizedText("Lobby 1", true)
catLabel:SetPrelocalizedText("Lobby 2", true)
--kpopLabel:SetPrelocalizedText("K-Pop Café", true)

-- functions --
local function disable()
    self.enabled = false
end

function changePlayerRoom(destination : Vector3)
    client.localPlayer.character:Teleport(destination, function()  end)
end

-- buttons logic --
function ActiveButton()
    -- Teleport Travel
    travelButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("travel")        
        disable()
    end)
    travelButton:Add(travelLabel)
    -- teleport CatCoffe
    catButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("cat")
        disable()
    end)
    catButton:Add(catLabel)
    -- Teleport Kpop
    --[[
    kpopButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("kpop")
        disable()
    end)
    kpopButton:Add(kpopLabel)
    --]]
end

ActiveButton()

client.PlayerConnected:Connect(function()

    gameManager = gameManagerGo:GetComponent("GameManager")

    --[[
    -- Set Maxime Point Player
    gameManager.scorePlayer[namePlayer] = 5;

    scoreLocalPlayer = gameManager.scorePlayer[namePlayer]
    --]]

    disable()
end)

