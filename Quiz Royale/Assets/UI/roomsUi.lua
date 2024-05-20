--!Type(UI)

--!Headers("Managers")
--!SerializeField
local gameManagerGo : GameObject = nil

-- bind labels --
--!Bind
local titleLabel : UILabel = nil
--!Bind
local travelLabel : UILabel = nil

-- instantiate buttons --
local travelButton = UIButton.new()

-- variables --
local gameManager = nil

-- set texts --
titleLabel:SetPrelocalizedText("Quiz Royale", true)
travelLabel:SetPrelocalizedText("Travel", true)

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
        gameManager.changeRoomServer:FireServer("kpop")
        disable()
    end)
     travelLabel:Add(travelButton)
end

ActiveButton()

client.PlayerConnected:Connect(function()
    gameManager = gameManagerGo:GetComponent("GameManager")
    disable()
end)