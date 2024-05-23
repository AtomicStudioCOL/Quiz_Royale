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
local catCafeLabel : UILabel = nil
--!Bind
local kpopLabel : UILabel = nil

-- instantiate buttons --
local catCafeButton = UIButton.new()
local kpopButton = UIButton.new()
local travelButton = UIButton.new()

-- variables --
local gameManager = nil

-- set tex ts --
titleLabel:SetPrelocalizedText("Quiz Royale", true)
travelLabel:SetPrelocalizedText("Travel Café", true)
catCafeLabel:SetPrelocalizedText("Cat Café", true)
kpopLabel:SetPrelocalizedText("K-Pop Café", true)

-- functions --
local function disable()
    self.enabled = false
end

function changePlayerRoom(destination : Vector3)
    client.localPlayer.character:Teleport(destination, function() end)
end

-- buttons logic --
function ActiveButton()
    -- Teleport Travel
    travelButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("travel")
        disable()
    end)
    travelLabel:Add(travelButton)
    -- teleport CatCoffe
    catCafeButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("catCoffe")
        disable()
    end)
    catCafeLabel:Add(catCafeButton)
    -- Teleport Kpop
    kpopButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("kpop")
        disable()
    end)
    kpopLabel:Add(kpopButton)
end

ActiveButton()

client.PlayerConnected:Connect(function()
    gameManager = gameManagerGo:GetComponent("GameManager")
    disable()
end)