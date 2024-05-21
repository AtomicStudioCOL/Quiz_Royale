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

-- set texts --
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
    travelButton:RegisterPressCallback(function()
        gameManager.changeRoomServer:FireServer("travel")
        disable()
    end)
    travelLabel:Add(travelButton)

    catCafeButton:RegisterPressCallback(function()
        --gameManager.changeRoomServer:FireServer("catCafe")
        print("Not there yet")
        disable()
    end)
    catCafeLabel:Add(catCafeButton)

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