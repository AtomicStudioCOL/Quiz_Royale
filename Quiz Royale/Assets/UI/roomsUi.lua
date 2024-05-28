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
local scoreLocalPlayer = 0
local namePlayer = client.localPlayer.name

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
    client.localPlayer.character:Teleport(destination, function()  end)
end

-- buttons logic --
function ActiveButton()
    -- Teleport Travel
    travelButton:RegisterPressCallback(function()

        --[[
        print("Testing Call for server_".. tostring(gameManager.scorePlayer[namePlayer]))
        
        gameManager.scorePlayer[namePlayer] = scoreLocalPlayer - 1;
        --]]

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

    --[[
    -- Set Maxime Point Player
    gameManager.scorePlayer[namePlayer] = 5;

    scoreLocalPlayer = gameManager.scorePlayer[namePlayer]
    --]]

    disable()
end)

